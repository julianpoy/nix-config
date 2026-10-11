{
  config,
  lib,
  pkgsUnstable,
  ...
}: let
  denoised = config.services.pipewire.extraConfig.pipewire ? "99-noise-suppression";

  nemoBase = "https://huggingface.co/csukuangfj/sherpa-onnx-nemo-streaming-fast-conformer-transducer-en-480ms-int8/resolve/main";

  asr =
    pkgsUnstable.runCommand "sherpa-onnx-nemo-streaming-fast-conformer-en" {
      encoder = pkgsUnstable.fetchurl {
        url = "${nemoBase}/encoder.int8.onnx";
        hash = "sha256-EAxWFpKaExtbPIyKsNg6q6LNyuFjrNjRkLTl/6X30FE=";
      };
      decoder = pkgsUnstable.fetchurl {
        url = "${nemoBase}/decoder.int8.onnx";
        hash = "sha256-TwRDGYhHL4x7gV+UKqaQGXaSnJ4iNTApaB/NsmLaAWQ=";
      };
      joiner = pkgsUnstable.fetchurl {
        url = "${nemoBase}/joiner.int8.onnx";
        hash = "sha256-0tjnKQpqgkWoPtIRqg3Yzfjv+4p8ZP45I5lWERG1LzA=";
      };
      tokens = pkgsUnstable.fetchurl {
        url = "${nemoBase}/tokens.txt";
        hash = "sha256-YY3BEPwiE4hrUuBj/0Iym73zeiZsp3BRhAkPpfOfMTE=";
      };
    } ''
      mkdir -p $out
      cp $encoder $out/encoder.int8.onnx
      cp $decoder $out/decoder.int8.onnx
      cp $joiner $out/joiner.int8.onnx
      cp $tokens $out/tokens.txt
    '';

  whisper = pkgsUnstable.whisper-cpp.override {vulkanSupport = true;};

  whisperModel = pkgsUnstable.fetchurl {
    url = "https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-base.en.bin";
    hash = "sha256-oDd5yG3zMjB19eeWyyzlAp8A7Ihp7uP9+4l6/jbG0AI=";
  };

  punct =
    pkgsUnstable.runCommand "sherpa-onnx-online-punct-en" {
      src = pkgsUnstable.fetchurl {
        url = "https://github.com/k2-fsa/sherpa-onnx/releases/download/punctuation-models/sherpa-onnx-online-punct-en-2024-08-06.tar.bz2";
        hash = "sha256-n15acsfSgpY1vQdPzpK2u9W3jailLnrY7RvpM/NmuZ0=";
      };
    } ''
      tar xf $src
      mkdir -p $out
      cp -r */* $out/
    '';

  sherpaPython = pkgsUnstable.python3.pkgs.toPythonModule (
    pkgsUnstable.runCommand "sherpa-onnx-python" {} ''
      mkdir -p $out/${pkgsUnstable.python3.sitePackages}
      cp -r ${pkgsUnstable.sherpa-onnx.python}/sherpa_onnx $out/${pkgsUnstable.python3.sitePackages}/
    ''
  );

  typelibs = with pkgsUnstable; [
    gtk3
    gtk-layer-shell
    glib.out
    pango.out
    gdk-pixbuf
    at-spi2-core
    harfbuzz
    gobject-introspection
  ];

  previewUnwrapped =
    pkgsUnstable.writers.writePython3Bin "dictation-preview" {
      libraries = [pkgsUnstable.python3Packages.pygobject3];
      flakeIgnore = ["E402" "E501"];
    } ''
      import sys
      import threading

      import cairo
      import gi

      gi.require_version("Gtk", "3.0")
      gi.require_version("GtkLayerShell", "0.1")
      from gi.repository import GLib, Gtk, GtkLayerShell

      IDLE = "●  listening"
      WIDTH = 64
      LIMIT = 220

      CSS = b"""
      window { background: transparent; }
      #bubble {
          background-color: rgba(18, 18, 22, 0.92);
          border-radius: 16px;
          border: 1px solid rgba(255, 255, 255, 0.12);
      }
      #bubble label {
          color: #f2f2f4;
          font-size: 14pt;
          margin: 12px 22px;
      }
      """

      window = Gtk.Window()
      window.set_app_paintable(True)

      bubble = Gtk.Box()
      bubble.set_name("bubble")

      label = Gtk.Label(label=IDLE)
      label.set_line_wrap(True)
      label.set_line_wrap_mode(2)
      label.set_width_chars(WIDTH)
      label.set_max_width_chars(WIDTH)
      label.set_xalign(0.5)
      label.set_justify(Gtk.Justification.CENTER)
      bubble.pack_start(label, True, True, 0)
      window.add(bubble)

      provider = Gtk.CssProvider()
      provider.load_from_data(CSS)
      Gtk.StyleContext.add_provider_for_screen(
          window.get_screen(),
          provider,
          Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION,
      )

      GtkLayerShell.init_for_window(window)
      GtkLayerShell.set_layer(window, GtkLayerShell.Layer.OVERLAY)
      GtkLayerShell.set_anchor(window, GtkLayerShell.Edge.BOTTOM, True)
      GtkLayerShell.set_margin(window, GtkLayerShell.Edge.BOTTOM, 140)
      GtkLayerShell.set_keyboard_mode(window, GtkLayerShell.KeyboardMode.NONE)


      def passthrough(*_):
          window.input_shape_combine_region(cairo.Region())


      window.connect("realize", passthrough)
      window.connect("size-allocate", passthrough)
      window.show_all()


      def update(text):
          if len(text) > LIMIT:
              text = "..." + text[-LIMIT:]
          label.set_text(text or IDLE)
          return False


      def pump():
          for line in sys.stdin:
              GLib.idle_add(update, line.rstrip("\n"))
          GLib.idle_add(Gtk.main_quit)


      threading.Thread(target=pump, daemon=True).start()
      Gtk.main()
    '';

  preview =
    pkgsUnstable.runCommand "dictation-preview" {
      nativeBuildInputs = [pkgsUnstable.makeWrapper];
    } ''
      mkdir -p $out/bin
      makeWrapper ${previewUnwrapped}/bin/dictation-preview $out/bin/dictation-preview \
        --set GI_TYPELIB_PATH ${lib.makeSearchPath "lib/girepository-1.0" typelibs}
    '';

  daemon =
    pkgsUnstable.writers.writePython3Bin "dictation" {
      libraries = [
        pkgsUnstable.python3Packages.evdev
        pkgsUnstable.python3Packages.numpy
        sherpaPython
      ];
      flakeIgnore = ["E501"];
    } ''
      import queue
      import re
      import subprocess
      import tempfile
      import threading
      import wave

      import evdev
      import numpy as np
      import sherpa_onnx

      DEVICE_NAME = "Wireless Radio Control"
      RATE = 16000
      CHUNK = RATE // 10
      YDOTOOL = "${lib.getExe pkgsUnstable.ydotool}"
      PW_RECORD = "${lib.getExe' pkgsUnstable.pipewire "pw-record"}"
      WHISPER = "${lib.getExe' whisper "whisper-cli"}"
      WHISPER_MODEL = "${whisperModel}"
      PREVIEW = "${preview}/bin/dictation-preview"
      MIN_REFINE = RATE * 6 // 10
      SETTLED_HOLD = RATE * 30
      HARD_HOLD = RATE * 45
      NON_SPEECH = re.compile(r"^[\[(][^\])]*[\])]$")


      def find_key_device():
          for path in evdev.list_devices():
              candidate = evdev.InputDevice(path)
              if DEVICE_NAME in candidate.name:
                  return candidate
          raise SystemExit("no input device matching " + DEVICE_NAME)


      key_device = find_key_device()

      recognizer = sherpa_onnx.OnlineRecognizer.from_transducer(
          tokens="${asr}/tokens.txt",
          encoder="${asr}/encoder.int8.onnx",
          decoder="${asr}/decoder.int8.onnx",
          joiner="${asr}/joiner.int8.onnx",
          model_type="conformer",
          num_threads=1,
          provider="cpu",
          decoding_method="greedy_search",
          enable_endpoint_detection=True,
      )

      punctuation = sherpa_onnx.OnlinePunctuation(
          sherpa_onnx.OnlinePunctuationConfig(
              model_config=sherpa_onnx.OnlinePunctuationModelConfig(
                  cnn_bilstm="${punct}/model.int8.onnx",
                  bpe_vocab="${punct}/bpe.vocab",
                  num_threads=1,
              )
          )
      )

      active = threading.Event()
      pending = queue.Queue()
      overlay = None


      def watch_key(device):
          for event in device.read_loop():
              if event.type != evdev.ecodes.EV_KEY:
                  continue
              if event.value != 1:
                  continue
              if event.code != evdev.ecodes.KEY_DICTATE:
                  continue
              if active.is_set():
                  active.clear()
              else:
                  active.set()


      def show(text):
          if overlay is None or overlay.poll() is not None:
              return
          try:
              overlay.stdin.write((text + "\n").encode())
              overlay.stdin.flush()
          except (BrokenPipeError, ValueError):
              pass


      def type_text(text):
          subprocess.run(
              [YDOTOOL, "type", "--key-delay", "1", "--key-hold", "1", "--file", "-"],
              input=text.encode(),
              check=False,
          )


      def polish(raw):
          if not raw.strip():
              return ""
          return punctuation.add_punctuation_with_case(raw.strip().lower())


      def refine(audio):
          if len(audio) < MIN_REFINE:
              return ""
          with tempfile.NamedTemporaryFile(suffix=".wav") as handle:
              with wave.open(handle.name, "wb") as out:
                  out.setnchannels(1)
                  out.setsampwidth(2)
                  out.setframerate(RATE)
                  out.writeframes((audio * 32767).astype(np.int16).tobytes())
              done = subprocess.run(
                  [WHISPER, "-m", WHISPER_MODEL, "-f", handle.name,
                   "-l", "en", "-nt", "-np", "-t", "4"],
                  capture_output=True,
                  check=False,
              )
          lines = done.stdout.decode(errors="replace").splitlines()
          text = " ".join(line.strip() for line in lines if line.strip())
          if NON_SPEECH.match(text):
              return ""
          return text


      def typist():
          while True:
              raw, audio = pending.get()
              text = refine(audio) or polish(raw)
              if text:
                  type_text(text + " ")


      def flush(stream, segment):
          raw = recognizer.get_result(stream)
          recognizer.reset(stream)
          if raw.strip() and segment:
              pending.put((raw, np.concatenate(segment)))


      def session():
          global overlay
          stream = recognizer.create_stream()
          segment = []
          held = 0
          previous = ""
          stall = 0
          overlay = subprocess.Popen([PREVIEW], stdin=subprocess.PIPE)
          recorder = subprocess.Popen(
              [
                  PW_RECORD, "--raw",
                  "--rate", str(RATE),
                  "--channels", "1",
                  "--format", "s16",
                  "--latency", "20ms",
                  "-",
              ],
              stdout=subprocess.PIPE,
          )
          try:
              while active.is_set():
                  buf = recorder.stdout.read(CHUNK * 2)
                  if not buf:
                      break
                  samples = np.frombuffer(buf, dtype=np.int16)
                  samples = samples.astype(np.float32) / 32768
                  segment.append(samples)
                  held += len(samples)
                  stream.accept_waveform(RATE, samples)
                  while recognizer.is_ready(stream):
                      recognizer.decode_stream(stream)
                  raw = recognizer.get_result(stream)
                  if raw.strip() and raw == previous:
                      stall += 1
                  else:
                      stall = 0
                  previous = raw
                  settled = held >= SETTLED_HOLD and stall >= 3
                  if recognizer.is_endpoint(stream) or settled or held >= HARD_HOLD:
                      flush(stream, segment)
                      segment = []
                      held = 0
                      previous = ""
                      stall = 0
                      show("")
                  else:
                      show(raw)
          finally:
              recorder.terminate()
              recorder.wait()
          stream.accept_waveform(RATE, np.zeros(RATE // 2, dtype=np.float32))
          stream.input_finished()
          while recognizer.is_ready(stream):
              recognizer.decode_stream(stream)
          flush(stream, segment)
          if overlay.poll() is None:
              overlay.stdin.close()
              overlay.wait()
          overlay = None


      threading.Thread(target=watch_key, args=(key_device,), daemon=True).start()
      threading.Thread(target=typist, daemon=True).start()

      while True:
          active.wait()
          session()
    '';
in {
  programs.ydotool.enable = true;

  users.users.julian.extraGroups = ["input" config.programs.ydotool.group];

  # Scancode 0x100c6 is the airplane-mode key, read with evtest.
  services.udev.extraHwdb = ''
    evdev:input:b0018v32ACp0006*
      KEYBOARD_KEY_100c6=dictate
  '';

  systemd.user.services.dictation = {
    description = "Streaming dictation daemon";
    wantedBy = ["graphical-session.target"];
    partOf = ["graphical-session.target"];
    serviceConfig = {
      ExecStart = lib.getExe daemon;
      Environment =
        [
          "YDOTOOL_SOCKET=${config.environment.variables.YDOTOOL_SOCKET}"
        ]
        ++ lib.optional denoised "PIPEWIRE_NODE=rnnoise_source";
      Restart = "on-failure";
      RestartSec = "2s";
    };
  };
}

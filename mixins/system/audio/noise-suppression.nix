{
  config,
  pkgs,
  ...
}: {
  services.pipewire.extraConfig.pipewire."99-noise-suppression" = {
    "context.modules" = [
      {
        name = "libpipewire-module-filter-chain";
        args = {
          "node.description" = "Noise Canceling Source";
          "media.name" = "Noise Canceling Source";
          "filter.graph".nodes = [
            {
              type = "ladspa";
              name = "rnnoise";
              plugin = "${pkgs.rnnoise-plugin}/lib/ladspa/librnnoise_ladspa.so";
              label = "noise_suppressor_mono";
              control = {
                "VAD Threshold (%)" = 50.0;
                "VAD Grace Period (ms)" = 200;
                "Retroactive VAD Grace (ms)" = 0;
              };
            }
          ];
          "capture.props" = {
            "node.name" = "effect_input.rnnoise";
            "node.passive" = true;
            "audio.rate" = 48000;
            "audio.channels" = 1;
            "audio.position" = ["MONO"];
          };
          "playback.props" = {
            "node.name" = "rnnoise_source";
            "media.class" = "Audio/Source";
            "audio.rate" = 48000;
            "audio.channels" = 1;
            "audio.position" = ["MONO"];
            "priority.session" = 1000;
          };
        };
      }
    ];
  };
}

{
  lib,
  pkgs,
  ...
}: let
  daemon = pkgs.writeShellApplication {
    name = "ambient-keyboard-backlight";
    runtimeInputs = [pkgs.systemd pkgs.coreutils];
    text = ''
      INTERVAL=5

      sensor=""
      for dev in /sys/bus/iio/devices/iio:device*; do
        if [ "$(cat "$dev/name")" = "als" ]; then
          sensor="$dev/in_illuminance_raw"
        fi
      done
      if [ -z "$sensor" ]; then
        echo "no ambient light sensor found" >&2
        exit 1
      fi

      level() {
        if [ "$1" -lt 10 ]; then
          echo 20
        elif [ "$1" -lt 80 ]; then
          echo 50
        else
          echo 0
        fi
      }

      set_brightness() {
        busctl --user call org.kde.Solid.PowerManagement \
          /org/kde/Solid/PowerManagement/Actions/KeyboardBrightnessControl \
          org.kde.Solid.PowerManagement.Actions.KeyboardBrightnessControl \
          setKeyboardBrightnessSilent i "$1"
      }

      applied=""
      candidate=""
      while true; do
        read -r lux < "$sensor"
        target=$(level "$lux")
        if [ "$target" = "$applied" ]; then
          candidate=""
        elif [ "$target" = "$candidate" ] || [ -z "$applied" ]; then
          set_brightness "$target" && applied=$target
          candidate=""
        else
          candidate=$target
        fi
        sleep "$INTERVAL"
      done
    '';
  };
in {
  systemd.user.services.ambient-keyboard-backlight = {
    description = "Adjust keyboard backlight from the ambient light sensor";
    wantedBy = ["graphical-session.target"];
    partOf = ["graphical-session.target"];
    after = ["plasma-powerdevil.service"];
    serviceConfig = {
      ExecStart = lib.getExe daemon;
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };
}

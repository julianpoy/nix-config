{
  config,
  lib,
  pkgs,
  ...
}: let
  notifier = pkgs.writeShellApplication {
    name = "nixos-update-notify";
    runtimeInputs = [pkgs.coreutils pkgs.libnotify];
    text = ''
      current=$(readlink -f /run/current-system)
      next=$(readlink -f /nix/var/nix/profiles/system)
      state="''${XDG_STATE_HOME:-$HOME/.local/state}/nixos-update-notify"

      if [ "$current" = "$next" ]; then
        exit 0
      fi
      if [ -f "$state" ] && [ "$(cat "$state")" = "$next" ]; then
        exit 0
      fi

      notify-send \
        --app-name=JulianNix \
        --icon=system-software-update \
        "JulianNix" \
        "A new JulianNix update has been installed, reboot to apply."

      mkdir -p "$(dirname "$state")"
      echo "$next" > "$state"
    '';
  };
in {
  system.autoUpgrade = {
    enable = true;
    flake = "github:julianpoy/nix-config#${config.networking.hostName}";
    dates = "daily";
    randomizedDelaySec = "30min";
    upgrade = false;
    operation = "boot";
  };

  systemd.services.nixos-upgrade = {
    startLimitIntervalSec = 86400;
    startLimitBurst = 4;
    serviceConfig = {
      Restart = "on-failure";
      RestartSec = "15min";
    };
  };

  nix.daemonCPUSchedPolicy = "idle";
  nix.daemonIOSchedClass = "idle";

  systemd.user.services.nixos-update-notify = {
    description = "Notify when a NixOS update is waiting for a reboot";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = lib.getExe notifier;
    };
  };

  systemd.user.timers.nixos-update-notify = {
    wantedBy = ["graphical-session.target"];
    partOf = ["graphical-session.target"];
    timerConfig = {
      OnActiveSec = "1min";
      OnUnitActiveSec = "30min";
    };
  };
}

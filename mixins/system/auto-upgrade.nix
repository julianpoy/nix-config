{
  config,
  lib,
  pkgs,
  ...
}: {
  system.autoUpgrade = {
    enable = true;
    flake = "github:julianpoy/nix-config#${config.networking.hostName}";
    dates = "daily";
    randomizedDelaySec = "30min";
    upgrade = false;
  };

  systemd.services.nixos-upgrade = {
    startLimitIntervalSec = 86400;
    startLimitBurst = 4;
    serviceConfig = {
      Restart = "on-failure";
      RestartSec = "15min";
    };
  };
}

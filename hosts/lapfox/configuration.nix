{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "lapfox";
  hardware.bluetooth.enable = true;

  system.stateVersion = "25.05";
}

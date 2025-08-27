{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "coop-theia";
  networking.interfaces.enp13s0.wakeOnLan.enable = true;

  system.stateVersion = "25.05";
}

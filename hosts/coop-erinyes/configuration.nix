{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "coop-erinyes";
  networking.interfaces.enp12s0.wakeOnLan.enable = true;

  system.stateVersion = "25.05";
}

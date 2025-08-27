{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "coop-erinyes";
  networking.interfaces.enp3s0.wakeOnLan.enable = true;

  system.stateVersion = "25.05";
}

{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "coop-thanatos";
  networking.interfaces.enp4s0.wakeOnLan.enable = true;

  system.stateVersion = "25.05";
}

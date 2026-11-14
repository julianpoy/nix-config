{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "coop-thanatos";
  networking.interfaces.eno1.wakeOnLan.enable = true;

  system.stateVersion = "25.05";
}

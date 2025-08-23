{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "coop-thanatos";

  system.stateVersion = "25.05";
}

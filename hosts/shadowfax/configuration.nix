{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "shadowfax";

  julian.mounts.asphodel.enable = true;

  system.stateVersion = "25.05";
}

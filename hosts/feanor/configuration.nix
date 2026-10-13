{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "feanor";

  julian.mounts.asphodel.enable = true;

  system.stateVersion = "25.05";
}

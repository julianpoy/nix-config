{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "feanor";

  system.stateVersion = "25.05";
}

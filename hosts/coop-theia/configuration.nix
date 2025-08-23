{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "coop-theia";

  system.stateVersion = "25.05";
}

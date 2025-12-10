{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "shadowfax";

  system.stateVersion = "25.05";
}

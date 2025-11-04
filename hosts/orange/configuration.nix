{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "orange";

  system.stateVersion = "25.05";
}

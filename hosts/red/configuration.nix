{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "red";

  system.stateVersion = "26.05";
}

{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "example";

  system.stateVersion = "26.05";
}

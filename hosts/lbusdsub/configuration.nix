{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "lbusdsub";

  system.stateVersion = "26.05";
}

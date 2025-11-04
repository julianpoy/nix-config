{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "tars";

  system.stateVersion = "25.05";
}

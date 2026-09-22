{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "pascal";

  system.stateVersion = "25.05";
}

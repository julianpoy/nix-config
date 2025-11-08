{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "flatbox";

  system.stateVersion = "25.05";
}

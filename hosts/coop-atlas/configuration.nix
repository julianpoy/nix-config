{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "coop-atlas";

  system.stateVersion = "25.05";
}

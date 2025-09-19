{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "waterworld";

  system.stateVersion = "25.05";
}

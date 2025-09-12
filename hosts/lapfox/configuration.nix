{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "lapfox";

  system.stateVersion = "25.05";
}

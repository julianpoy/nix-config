{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "elysium";

  system.stateVersion = "25.05";
}

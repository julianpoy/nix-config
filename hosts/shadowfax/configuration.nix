{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "shadowfax";

  boot.loader.grub.device = "nodev";

  julian.mounts.asphodel.enable = true;

  system.stateVersion = "25.05";
}

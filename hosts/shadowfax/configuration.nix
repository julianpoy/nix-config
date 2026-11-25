{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "shadowfax";

  boot.loader.grub.device = "nodev";

  boot.resumeDevice = "/dev/mapper/crypted";
  boot.kernelParams = ["resume_offset=89352192"];

  julian.mounts.asphodel.enable = true;

  system.stateVersion = "25.05";
}

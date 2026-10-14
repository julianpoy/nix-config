{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "framenix";

  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.efiInstallAsRemovable = lib.mkForce false;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;

  time.hardwareClockInLocalTime = true;

  system.stateVersion = "25.05";
}

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
  boot.loader.grub.extraEntries = ''
    menuentry "Windows" {
      insmod part_gpt
      insmod fat
      insmod search_fs_file
      insmod chain
      search --file --set=root /EFI/Microsoft/Boot/bootmgfw.efi
      chainloader /EFI/Microsoft/Boot/bootmgfw.efi
    }
  '';

  time.hardwareClockInLocalTime = true;

  system.stateVersion = "25.05";
}

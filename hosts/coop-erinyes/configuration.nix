{
  config,
  lib,
  pkgs,
  ...
}: {
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.efiInstallAsRemovable = true;

  services.openssh.enable = true;
  services.avahi.enable = true;

  networking.hostName = "coop-erinyes";

  system.stateVersion = "25.05";
}

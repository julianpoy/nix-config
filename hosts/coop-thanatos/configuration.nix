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

  networking.hostName = "coop-thanatos";

  system.stateVersion = "25.05";

  time.timeZone = "America/Los_Angeles";
}

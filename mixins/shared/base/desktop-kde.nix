{
  config,
  pkgs,
  lib,
  options,
  ...
}: {
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
}

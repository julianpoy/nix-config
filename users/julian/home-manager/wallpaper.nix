{
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf (osConfig.services.desktopManager.plasma6.enable or false) {
    programs.plasma = {
      workspace = {
        wallpaper = ./rainier.jpg;
        wallpaperFillMode = "preserveAspectCrop";
      };

      kscreenlocker.appearance.wallpaper = ./rainier.jpg;
    };
  };
}

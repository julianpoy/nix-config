{
  lib,
  osConfig,
  plasma-manager,
  ...
}: {
  imports = [
    plasma-manager.homeModules.plasma-manager
  ];

  config = lib.mkIf (osConfig.services.desktopManager.plasma6.enable or false) {
    programs.plasma = {
      enable = true;

      overrideConfig = true;
      immutableByDefault = true;

      workspace.lookAndFeel = "org.kde.breezedark.desktop";

      input.keyboard.options = ["caps:escape"];

      input.touchpads = [
        {
          name = "PIXA3854:00 093A:1343 Touchpad";
          vendorId = "093A";
          productId = "1343";
          naturalScroll = true;
          tapToClick = false;
          disableWhileTyping = false;
          rightClickMethod = "twoFingers";
          scrollSpeed = 0.5;
        }
      ];

      panels = [
        {
          location = "bottom";
          floating = true;
          height = 46;
          widgets = [
            "org.kde.plasma.kickoff"
            "org.kde.plasma.pager"
            "org.kde.plasma.icontasks"
            "org.kde.plasma.marginsseparator"
            {
              systemTray.items.configs.battery.showPercentage = true;
            }
            "org.kde.plasma.digitalclock"
            "org.kde.plasma.showdesktop"
          ];
        }
      ];

      configFile = {
        kwinrc = {
          TabBox = {
            HighlightWindows = false;
            LayoutName = "compact";
          };

          Desktops = {
            Id_1 = "fa25981f-248c-416d-b8e0-24ce87dbc97b";
            Number = 1;
            Rows = 1;
          };
          "Tiling/fa25981f-248c-416d-b8e0-24ce87dbc97b/ce14aa22-949a-45f3-9c96-13b4099c1bc8" = {
            padding = 4;
            tiles = ''{"layoutDirection":"horizontal","tiles":[{"width":0.25},{"width":0.5},{"width":0.25}]}'';
          };
        };

        kwalletrc.Wallet."First Use" = false;
      };
    };
  };
}

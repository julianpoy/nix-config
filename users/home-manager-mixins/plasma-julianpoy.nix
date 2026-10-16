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

      krunner.position = "center";

      session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";

      shortcuts.kwin = {
        "Walk Through Windows" = "Alt+Tab";
        "Walk Through Windows (Reverse)" = "Alt+Shift+Tab";
        "Walk Through Windows Alternative" = "Meta+Tab";
        "Walk Through Windows Alternative (Reverse)" = "Meta+Shift+Tab";
        "Walk Through Windows of Current Application" = "Alt+`";
        "Walk Through Windows of Current Application (Reverse)" = "Alt+~";
        "Walk Through Windows of Current Application Alternative" = "Meta+`";
        "Walk Through Windows of Current Application Alternative (Reverse)" = "Meta+~";
      };

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
          pointerSpeed = -0.1;
          scrollSpeed = 0.3;
        }
      ];

      panels = [
        {
          location = "bottom";
          floating = true;
          hiding = "autohide";
          height = 46;
          widgets = [
            "org.kde.plasma.kickoff"
            "org.kde.plasma.pager"
            "org.kde.plasma.icontasks"
            "org.kde.plasma.marginsseparator"
            {
              systemTray.items.shown = ["org.kde.plasma.battery"];
            }
            "org.kde.plasma.digitalclock"
            "org.kde.plasma.showdesktop"
          ];
        }
      ];

      startup.desktopScript.battery-percentage = {
        priority = 3;
        runAlways = true;
        text = ''
          panels().forEach((panel) => {
            panel.widgets("org.kde.plasma.systemtray").forEach((tray) => {
              const items = ["Applets", String(tray.id), "Applets"];
              panel.currentConfigGroup = items;
              String(panel.configGroups).split(",").forEach((id) => {
                panel.currentConfigGroup = items.concat([id]);
                if (panel.readConfig("plugin") != "org.kde.plasma.battery") return;
                panel.currentConfigGroup = items.concat([id, "Configuration", "General"]);
                panel.writeConfig("showPercentage", true);
              });
            });
            panel.reloadConfig();
          });
        '';
      };

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

        krunnerrc = {
          Plugins = {
            krunner_katesessionsEnabled = false;
            krunner_konsoleprofilesEnabled = false;
            krunner_sessionsEnabled = false;
          };
          "Plugins/Favorites".plugins = "krunner_sessions,krunner_powerdevil,krunner_services,krunner_systemsettings";
        };

        kwalletrc.Wallet."First Use" = false;

        "powerdevil.notifyrc" = {
          "Event\\/pluggedin".Action = "";
          "Event\\/unplugged".Action = "";
        };
      };
    };
  };
}

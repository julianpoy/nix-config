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

        kcminputrc."Libinput/2362/4931/PIXA3854:00 093A:1343 Touchpad" = {
          PointerAccelerationProfile = lib.mkForce 4;
          PointerAccelerationCustomPointsMotion = "0.625:0.0000,0.1848,0.3862,0.6300,0.9315,1.1868,1.4858,1.9128,2.3398,2.7668,3.3123,3.9424,4.6699,5.5549,6.4380,7.1188,7.6083,8.0032,8.3995,8.9419,9.6362,10.3360,11.0557,11.7753,12.4950,13.2232,13.9513,14.6795,15.4133,16.1472,16.8810,17.6148,18.3487,19.0825,19.8163,20.5502,21.2840,22.0150,22.7460,23.4770,24.2080,24.9390,25.6700,26.3982,27.1263,27.8545,28.5798,29.3052,30.0305,30.7558,31.4812,32.2065,32.9318,33.6572,34.3825,35.1078,35.8332,36.5585,37.2838,38.0092,38.7345,39.4598,40.1852,40.9105";
          PointerAccelerationCustomPointsScroll = "0.15:0.0000,0.0191,0.0450,0.0762,0.1122,0.1522,0.1961,0.2433,0.2938,0.3473,0.4036,0.4627,0.5244,0.5887,0.6553,0.7242,0.7954,0.8770,0.9765,1.0930,1.2256,1.3734,1.5355,1.7111,1.8993,2.0991,2.3096,2.5300,2.7594,2.9968,3.2415,3.4923,3.7486,4.0094,4.2738,4.5408,4.8097,5.0795,5.3493,5.6182,5.8854,6.1498,6.4108,6.6672,6.9183,7.1632,7.4009,7.6306,7.8514,8.0672,8.2827,8.4979,8.7129,8.9275,9.1420,9.3562,9.5702,9.7840,9.9977,10.2111,10.4244,10.6376,10.8506,11.0635";
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

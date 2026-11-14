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
      immutableByDefault = false;

      workspace.lookAndFeel = "org.kde.breezedark.desktop";

      session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";

      powerdevil.AC = {
        autoSuspend.action = "nothing";
        turnOffDisplay.idleTimeout = "never";
        dimDisplay.enable = false;
      };

      kscreenlocker = {
        autoLock = false;
        lockOnResume = false;
      };

      panels = [
        {
          location = "bottom";
          height = 46;
          widgets = [
            "org.kde.plasma.kickoff"
            {
              iconTasks.launchers = [
                "applications:steam.desktop"
                "applications:firefox.desktop"
                "applications:org.prismlauncher.PrismLauncher.desktop"
                "applications:org.kde.dolphin.desktop"
              ];
            }
            "org.kde.plasma.marginsseparator"
            "org.kde.plasma.systemtray"
            "org.kde.plasma.digitalclock"
            "org.kde.plasma.showdesktop"
          ];
        }
      ];

      configFile.kwalletrc.Wallet.Enabled = false;
    };
  };
}

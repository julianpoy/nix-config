{
  pkgs,
  lib,
  config,
  ...
}: {
  home-manager.users.julian = {
    xdg.configFile."discord/settings.json".text = ''
      {
        "SKIP_HOST_UPDATE": true
      }
    '';
  };
}

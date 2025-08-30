{
  pkgs,
  lib,
  config,
  ...
}: {
  xdg.configFile."discord/settings.json".text = ''
    {
      "SKIP_HOST_UPDATE": true
    }
  '';
}

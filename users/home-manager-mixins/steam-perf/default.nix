{
  pkgs,
  lib,
  config,
  ...
}: {
  home.file.".steam/steam/steam_dev.cfg".text = ''
  @fDownloadRateImprovementToAddAnotherConnection 1.1
  '';
}

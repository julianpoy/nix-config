{
  config,
  pkgs,
  ...
}: let
  # Taken from the Laptop 13 Pro (Intel Core Ultra Series 3) Windows
  # driver bundle as DEV_0285_SUBSYS_F111000F (Realtek ALC285) and converted
  # with https://github.com/antoinecellerier/speaker-tuning-to-easyeffects
  irs = ./dolby-detailed.irs;

  configPackage = pkgs.runCommand "dolby-detailed-pipewire-config" {} ''
    mkdir -p $out/share/pipewire/pipewire.conf.d
    substitute ${./dolby-detailed.conf} \
      $out/share/pipewire/pipewire.conf.d/99-dolby-detailed.conf \
      --replace-fail '@IRS@' '${irs}'
  '';
in {
  services.pipewire.configPackages = [configPackage];
  services.pipewire.extraLv2Packages = [pkgs.lsp-plugins];
}

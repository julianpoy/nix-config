{pkgs, ...}: let
  irs = ../framework-13-intel-core-ultra-series3/dolby-detailed.irs;

  configPackage = pkgs.runCommand "dolby-custom-pipewire-config" {} ''
    mkdir -p $out/share/pipewire/pipewire.conf.d
    substitute ${./dolby-custom.conf} \
      $out/share/pipewire/pipewire.conf.d/99-dolby-custom.conf \
      --replace-fail '@IRS@' '${irs}'
  '';
in {
  services.pipewire.configPackages = [configPackage];
  services.pipewire.extraLv2Packages = [pkgs.lsp-plugins];
}

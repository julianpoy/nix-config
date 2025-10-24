{
  config,
  pkgs,
  lib,
  ...
}: {
  # Modifies the Steam extra packages with some additional things for mods and external apps
  # This is not necessary unless you're using the Steam FHS to run non-Steam things
  programs.steam.package = pkgs.steam.override {
    extraPkgs = pkgs': with pkgs'; [
      xorg.libICE
      xorg.libSM
    ];
  };
}


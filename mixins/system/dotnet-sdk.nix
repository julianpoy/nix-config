{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_9}/share/dotnet";
  };

  environment.systemPackages = with pkgs; [
    dotnet-runtime
    dotnet-sdk_9
    xorg.libICE
    fontconfig
  ];

  programs.nix-ld = {
    enable = true;
    libraries = (pkgs.steam-run.args.multiPkgs pkgs) ++ [
      pkgs.glibc
      pkgs.gcc.cc.lib
      pkgs.fontconfig
      pkgs.xorg.libX11
      pkgs.xorg.libICE
      pkgs.xorg.libSM
      pkgs.stdenv.cc.cc
      pkgs.libcap

      # Add 32-bit runtime support
      pkgs.pkgsi686Linux.glibc
      pkgs.pkgsi686Linux.zlib
      pkgs.pkgsi686Linux.gcc.cc.lib
      pkgs.pkgsi686Linux.xorg.libX11
      pkgs.pkgsi686Linux.xorg.libXext
    ];
  };

  # programs.nix-ld.libraries = with pkgs; [
  #   pkgs.steam-run.fhsenv.args.multiPkgs pkgs
  #   glibc
  #   gcc.cc.lib
  #   fontconfig
  #   xorg.libX11
  #   xorg.libICE
  #   xorg.libSM
  #   stdenv.cc.cc
  #   libcap
  #
  #   # Add 32-bit runtime support
  #   pkgsi686Linux.glibc
  #   pkgsi686Linux.zlib
  #   pkgsi686Linux.gcc.cc.lib
  #   pkgsi686Linux.xorg.libX11
  #   pkgsi686Linux.xorg.libXext
  # ];

  # environment.variables = {
  #   NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
  #     pkgs.fontconfig
  #   ];
  # };
}

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

  programs.nix-ld.libraries = with pkgs; [
    glibc
    gcc.cc.lib
    fontconfig
    xorg.libX11
    xorg.libICE
    xorg.libSM
    stdenv.cc.cc
    libcap

    # Add 32-bit runtime support
    pkgsi686Linux.glibc
    pkgsi686Linux.gcc.cc.lib
    pkgsi686Linux.xorg.libX11
    pkgsi686Linux.xorg.libXext
  ];

  # environment.variables = {
  #   NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
  #     pkgs.fontconfig
  #   ];
  # };

  # Temporary while debugging
  programs.nix-ld.enable = true;
}

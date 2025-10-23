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
    fontconfig
  ];
  # environment.variables = {
  #   NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
  #     pkgs.fontconfig
  #   ];
  # };

  # Temporary while debugging
  programs.nix-ld.enable = true;
}

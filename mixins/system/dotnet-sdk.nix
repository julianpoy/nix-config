{
  config,
  pkgs,
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

  environment.variables = {
    LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
      # ...other libs
      fontconfig
    ];
  };

  # Temporary while debugging
  programs.nix-ld.enable = true;
}

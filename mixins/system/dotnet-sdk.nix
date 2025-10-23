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
  ];

  # Temporary while debugging
  programs.nix-ld.enable = true;
}

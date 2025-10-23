{
  config,
  pkgs,
  ...
}: {
  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet";
  };

  environment.systemPackages = with pkgs; [
    dotnet-runtime
    dotnet-sdk
  ];
}

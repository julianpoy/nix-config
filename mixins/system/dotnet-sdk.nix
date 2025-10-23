{
  config,
  pkgs,
  ...
}: {
  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}";
  };

  environment.systemPackages = with pkgs; [
    dotnet-runtime
    dotnet-sdk
  ];
}

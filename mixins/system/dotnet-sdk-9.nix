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
    dotnet-sdk_9
  ];
}

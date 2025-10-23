{
  config,
  pkgs,
  ...
}: {
  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-runtime}";
  };

  environment.systemPackages = with pkgs; [dotnet-runtime];
}

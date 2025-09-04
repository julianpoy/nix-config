{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [cura-appimage];
}

{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    nextcloud-desktop
  ];
}

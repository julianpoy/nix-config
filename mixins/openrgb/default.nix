{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./purple.nix
  ];

  services.hardware.openrgb.enable = true;
  environment.systemPackages = with pkgs; [ openrgb-with-all-plugins ];
}

{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [ solaar ];

  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;
}

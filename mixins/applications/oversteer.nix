{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    oversteer usb-modeswitch
  ];

  services.udev.packages = with pkgs; [ oversteer ];

  boot.kernelModules = [ "hid-logitech-hidpp" ];
}

{
  config,
  pkgs,
  ...
}: {
  # nixos-hardware's speaker filter chain. Its EQ is tuned for the Framework
  # Laptop 13 7040 AMD chassis.
  hardware.framework.laptop13.audioEnhancement = {
    enable = true;
    rawDeviceName = "alsa_output.pci-0000_c1_00.6.analog-stereo";
  };
}

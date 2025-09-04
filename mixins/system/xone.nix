{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [linuxKernel.packages.linux_zen.xone];
  hardware.xone.enable = true;
}

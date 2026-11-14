{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "coop-erinyes";
  networking.interfaces.enp12s0.wakeOnLan.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_580;

  system.stateVersion = "25.05";
}

{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "elysium";

  networking.useDHCP = false;
  networking.bridges = {
    br0 = {
      interfaces = [ "enp14s0" ];
    };
  };
  networking.interfaces.br0.useDHCP = true;

  system.stateVersion = "25.05";
}

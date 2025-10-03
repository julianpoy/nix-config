{stateVersion}: {
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./home-manager
  ];

  users.users.bardsko = {
    isNormalUser = true;
    description = "Michael Botsko";
    extraGroups = [
      "networkmanager"
      "wheel"

      (lib.mkIf (config.virtualisation.libvirtd.enable) "libvirtd")
      (lib.mkIf (config.virtualisation.virtualbox.host.enable) "vboxusers")
      (lib.mkIf (config.virtualisation.docker.enable) "docker")
    ];
    hashedPassword = "$y$j9T$gwpLbiaTnfuROpVc02f270$RGWJo/xgnc56d.w482vswE/8gJEud/6jNUa9025YYQ0";
  };

  users.users.bardsko.openssh.authorizedKeys.keys = [];

  home-manager.users.bardsko.home.stateVersion = stateVersion;
}

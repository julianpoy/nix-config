{stateVersion}: {
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./home-manager
  ];

  users.users.chris = {
    isNormalUser = true;
    description = "Chris Meyer";
    extraGroups = [
      "networkmanager"
      "wheel"

      (lib.mkIf (config.virtualisation.libvirtd.enable) "libvirtd")
      (lib.mkIf (config.virtualisation.virtualbox.host.enable) "vboxusers")
      (lib.mkIf (config.virtualisation.docker.enable) "docker")
    ];
    hashedPassword = "$y$j9T$mH3FvkE0KX6hUfNg66JBv1$64k2G/F.diXH7ifWg1sXjNY5HG2FnitOBpSPvAXkAY4";
  };

  users.users.chris.openssh.authorizedKeys.keys = [];

  home-manager.users.chris.home.stateVersion = stateVersion;
}

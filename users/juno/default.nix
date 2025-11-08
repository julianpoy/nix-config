{stateVersion}: {
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./home-manager
  ];

  users.users.juno = {
    isNormalUser = true;
    description = "Juno";
    extraGroups = [
      "networkmanager"
      "wheel"

      (lib.mkIf (config.virtualisation.libvirtd.enable) "libvirtd")
      (lib.mkIf (config.virtualisation.virtualbox.host.enable) "vboxusers")
      (lib.mkIf (config.virtualisation.docker.enable) "docker")
    ];
    hashedPassword = "$y$j9T$JfUUJthqPZB7Glk0XTS0A0$QWoY4bU3uEUb138j3KhEFjbYpZV4oHo6wF3vF4WeRa4";
  };

  users.users.juno.openssh.authorizedKeys.keys = [];

  home-manager.users.juno.home.stateVersion = stateVersion;
}

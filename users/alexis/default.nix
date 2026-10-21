{stateVersion}: {
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./home-manager
  ];

  users.users.alexis = {
    isNormalUser = true;
    description = "Alexis Poyourow";
    extraGroups = [
      "networkmanager"
      "wheel"

      (lib.mkIf (config.virtualisation.libvirtd.enable) "libvirtd")
      (lib.mkIf (config.virtualisation.virtualbox.host.enable) "vboxusers")
      (lib.mkIf (config.virtualisation.docker.enable) "docker")
    ];
    hashedPassword = "$y$j9T$m3PmexZ4vna3yG0BvnXcj1$LJiJSSBlgdF/dXk0zIayOc3VIrQPhGjmjSzYQzAyeT4";
  };

  users.users.alexis.shell = pkgs.fish;
  users.users.alexis.openssh.authorizedKeys.keys = [];

  home-manager.users.alexis.home.stateVersion = stateVersion;
}

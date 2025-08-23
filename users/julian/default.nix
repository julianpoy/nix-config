{stateVersion}: {
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./home-manager
  ];

  users.users.julian = {
    isNormalUser = true;
    description = "Julian Poyourow";
    extraGroups = [
      "networkmanager"
      "wheel"

      (lib.mkIf (config.virtualisation.libvirtd.enable) "libvirtd")
      (lib.mkIf (config.virtualisation.virtualbox.host.enable) "vboxusers")
      (lib.mkIf (config.virtualisation.docker.enable) "docker")
    ];
    hashedPassword = "$y$j9T$anxWvMNhRJmSoFzgYKY1U/$AivFwYsS/9Cwh8D7OAEjbdA.wnbE1VQr9MwNOlXpC43";
  };

  home-manager.users.julian.home.stateVersion = stateVersion;
}

{stateVersion}: {
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./home-manager
  ];

  users.users.wesley = {
    isNormalUser = true;
    description = "Wesley Huang";
    extraGroups = [
      "networkmanager"
      "wheel"

      (lib.mkIf (config.virtualisation.libvirtd.enable) "libvirtd")
      (lib.mkIf (config.virtualisation.virtualbox.host.enable) "vboxusers")
      (lib.mkIf (config.virtualisation.docker.enable) "docker")
    ];
    hashedPassword = "$y$j9T$MAFxAGveVUZidMSknVVxi0$EDoJlrbKa43EU28/WEQtt7Qu413gdmYrxXaa44leJU9";
  };

  users.users.wesley.shell = pkgs.fish;
  users.users.wesley.openssh.authorizedKeys.keys = [];

  home-manager.users.wesley.home.stateVersion = stateVersion;
}

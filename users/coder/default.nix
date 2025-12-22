{stateVersion}: {
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./home-manager
  ];

  security.sudo.extraRules = [
    {
      users = [ "coder" ];
      options = [ "NOPASSWD" ];
    }
  ];

  users.users.coder = {
    isNormalUser = true;
    description = "Coder";
    extraGroups = [
      "networkmanager"
      "wheel"

      (lib.mkIf (config.virtualisation.libvirtd.enable) "libvirtd")
      (lib.mkIf (config.virtualisation.virtualbox.host.enable) "vboxusers")
      (lib.mkIf (config.virtualisation.docker.enable) "docker")
    ];
  };

  home-manager.users.coder.home.stateVersion = stateVersion;
}

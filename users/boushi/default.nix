{stateVersion}: {
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./home-manager
  ];

  users.users.boushi = {
    isNormalUser = true;
    description = "Boushi G";
    extraGroups = [
      "networkmanager"
      "wheel"

      (lib.mkIf (config.virtualisation.libvirtd.enable) "libvirtd")
      (lib.mkIf (config.virtualisation.virtualbox.host.enable) "vboxusers")
      (lib.mkIf (config.virtualisation.docker.enable) "docker")
    ];
    hashedPassword = "$6$EEw0xjgQPNXmlCp1$6GIAXbJJVuVDBozfccwxEixQOA9NQYCubzSUioFWEzKs/WGsd/AUMebM3bGFLfi9iz7/CIhrqsqJwMO8BQLUx.";
  };

  users.users.boushi.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHtazqq0os9PkuVeo1Up7//7v2ugMC0KyUU/K6AvV1Nq lapfox"
  ];

  home-manager.users.boushi.home.stateVersion = stateVersion;
}

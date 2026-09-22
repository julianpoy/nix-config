{stateVersion}: {
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./home-manager
  ];

  users.users.brisa = {
    isNormalUser = true;
    description = "Brisa Botsko";
    extraGroups = [
      "networkmanager"
      "wheel"

      (lib.mkIf (config.virtualisation.libvirtd.enable) "libvirtd")
      (lib.mkIf (config.virtualisation.virtualbox.host.enable) "vboxusers")
      (lib.mkIf (config.virtualisation.docker.enable) "docker")
    ];
    hashedPassword = "$6$LJpcACiLovue8ECn$PWWHjxp8GpUdGlZ/9T0axMCS9Ds/fW575O5dfZcwle2w1yeBmYeBXjdGp/NcTKe.IZHqqXYpgE3fLgZdhBJQl1";
  };

  users.users.brisa.openssh.authorizedKeys.keys = [];

  home-manager.users.brisa.home.stateVersion = stateVersion;
}

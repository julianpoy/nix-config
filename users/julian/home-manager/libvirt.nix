{
  pkgs,
  config,
  ...
}: {
  home-manager.users.julian.dconf.settings = lib.mkIf (config.virtualisation.libvirtd.enable) {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}

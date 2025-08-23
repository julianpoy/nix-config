{
  config,
  pkgs,
  ...
}: {
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-top
    gnome.gnome-boxes
  ];
}

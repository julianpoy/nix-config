{
  config,
  pkgs,
  lib,
  options,
  ...
}: {
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome.core-apps.enable = false;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];

  environment.systemPackages = with pkgs; [
    nautilus
    papers
    loupe
    gnome-text-editor
    gnome-calculator
    gnome-calendar
    gnome-clocks
    gnome-weather
    gnome-system-monitor
    baobab
    snapshot
    simple-scan
  ];

  programs.gnome-disks.enable = true;
  programs.seahorse.enable = true;
  services.gnome.sushi.enable = true;
}

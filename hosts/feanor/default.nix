{specialArgs, ...}:
specialArgs.nixpkgs-2505.lib.nixosSystem {
  inherit specialArgs;
  system = "x86_64-linux";
  modules = [
    specialArgs.disko.nixosModules.disko
    ./disk-config.nix

    ./configuration.nix
    ./hardware-configuration.nix

    (import "${specialArgs.home-manager-2505}/nixos")
    (import ../../users/julian {stateVersion = "25.05";})

    ../../mixins/base

    ../../mixins/appimage
    ../../mixins/cura
    ../../mixins/dbeaver
    ../../mixins/discord
    ../../mixins/element
    ../../mixins/firefox
    ../../mixins/flatpak
    ../../mixins/gimp
    ../../mixins/libreoffice
    ../../mixins/logitech
    ../../mixins/nextcloud-desktop
    ../../mixins/obs
    ../../mixins/openrgb
    ../../mixins/slack
    ../../mixins/spotify
    ../../mixins/steam
    ../../mixins/vlc
    ../../mixins/xone
    ../../mixins/yubikey
    ../../mixins/zoom-us
  ];
}

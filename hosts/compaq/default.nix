{specialArgs, ...}:
specialArgs.nixpkgs-2505.lib.nixosSystem {
  inherit specialArgs;
  system = "x86_64-linux";
  modules = [
    specialArgs.disko.nixosModules.disko
    ./disk-config.nix

    ../../mixins/nixpkgsUnstable

    ./configuration.nix
    ./hardware-configuration.nix

    (import "${specialArgs.home-manager-2505}/nixos")
    ({...}: {home-manager.extraSpecialArgs = specialArgs;})
    (import ../../users/julian {stateVersion = "25.05";})

    specialArgs.nix-flatpak.nixosModules.nix-flatpak

    ../../mixins/base

    ../../mixins/appimage
    ../../mixins/coder
    ../../mixins/discord
    ../../mixins/dnscache
    ../../mixins/element
    ../../mixins/firefox
    ../../mixins/fish
    ../../mixins/flatpak
    ../../mixins/gimp
    ../../mixins/latestkernel
    ../../mixins/libreoffice
    ../../mixins/neovim
    ../../mixins/nextcloud-desktop
    ../../mixins/obs
    ../../mixins/slack
    ../../mixins/spotify
    ../../mixins/steam
    ../../mixins/vlc
    ../../mixins/xone
    ../../mixins/yubikey
    #mozilla-vpn
  ];
}

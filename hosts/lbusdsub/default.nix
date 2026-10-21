{specialArgs, ...}:
specialArgs.nixpkgs-2605.lib.nixosSystem {
  inherit specialArgs;
  system = "x86_64-linux";
  modules = [
    specialArgs.disko.nixosModules.disko
    ./disk-config.nix

    ./configuration.nix
    ./hardware-configuration.nix

    (import "${specialArgs.home-manager-2605}/nixos")
    ({...}: {home-manager.extraSpecialArgs = specialArgs;})
    (import ../../users/alexis {stateVersion = "26.05";})

    ../../mixins/shared/base

    ../../mixins/applications/discord.nix
    ../../mixins/applications/firefox.nix
    ../../mixins/applications/gimp.nix
    ../../mixins/applications/google-chrome.nix
    ../../mixins/applications/libreoffice.nix
    ../../mixins/applications/logitech.nix
    ../../mixins/applications/obs.nix
    ../../mixins/applications/spotify.nix
    ../../mixins/applications/vlc.nix
    ../../mixins/applications/zoom-us.nix
    ../../mixins/cli/fish.nix
    ../../mixins/cli/neovim.nix
    ../../mixins/system/appimage.nix
    ../../mixins/system/bluetooth.nix
    ../../mixins/system/fwupd.nix
    ../../mixins/system/garbage-collection.nix
    ../../mixins/system/swap16.nix
    ../../mixins/system/thermald.nix
  ];
}

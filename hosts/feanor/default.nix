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
    ({...}: {home-manager.extraSpecialArgs = specialArgs;})
    (import ../../users/julian {stateVersion = "25.05";})

    ../../mixins/shared/base

    ../../mixins/applications/cura.nix
    ../../mixins/applications/darktable.nix
    ../../mixins/applications/dbeaver.nix
    ../../mixins/applications/discord-flatpak.nix
    ../../mixins/applications/element.nix
    ../../mixins/applications/firefox.nix
    ../../mixins/applications/gimp.nix
    ../../mixins/applications/google-chrome.nix
    ../../mixins/applications/kenku-fm.nix
    ../../mixins/applications/libreoffice.nix
    ../../mixins/applications/logitech.nix
    ../../mixins/applications/nextcloud-desktop.nix
    ../../mixins/applications/obs.nix
    ../../mixins/applications/slack.nix
    ../../mixins/applications/spotify.nix
    ../../mixins/applications/steam.nix
    ../../mixins/applications/steam-flatpak.nix
    ../../mixins/applications/vlc.nix
    ../../mixins/applications/zoom-us.nix
    ../../mixins/cli/coder.nix
    ../../mixins/cli/fish.nix
    ../../mixins/cli/litra-rs.nix
    ../../mixins/cli/neovim.nix
    ../../mixins/system/amdtuning.nix
    ../../mixins/system/appimage.nix
    ../../mixins/system/flatpak.nix
    ../../mixins/system/latest-kernel.nix
    ../../mixins/system/swap32.nix
    ../../mixins/system/xone.nix
    ../../mixins/system/yubikey.nix
  ];
}

{specialArgs, ...}:
specialArgs.nixpkgs-2511.lib.nixosSystem {
  inherit specialArgs;
  system = "x86_64-linux";
  modules = [
    specialArgs.disko.nixosModules.disko
    ./disk-config.nix

    ./configuration.nix
    ./hardware-configuration.nix

    (import "${specialArgs.home-manager-2511}/nixos")
    ({...}: {home-manager.extraSpecialArgs = specialArgs;})
    (import ../../users/chris {stateVersion = "25.05";})

    "${specialArgs.nixos-hardware}/framework/13-inch/7040-amd"

    ../../mixins/shared/base

    ../../mixins/applications/dbeaver.nix
    ../../mixins/applications/discord-flatpak.nix
    ../../mixins/applications/firefox.nix
    ../../mixins/applications/gimp.nix
    ../../mixins/applications/google-chrome.nix
    ../../mixins/applications/libreoffice.nix
    ../../mixins/applications/logitech.nix
    ../../mixins/applications/obs.nix
    ../../mixins/applications/spotify.nix
    ../../mixins/applications/steam.nix
    ../../mixins/applications/vlc.nix
    ../../mixins/applications/zoom-us.nix
    ../../mixins/cli/coder.nix
    ../../mixins/cli/fish.nix
    ../../mixins/cli/neovim.nix
    ../../mixins/system/audio/block-mic-autoadjust.nix
    ../../mixins/system/amdtuning.nix
    ../../mixins/system/appimage.nix
    ../../mixins/system/bluetooth.nix
    ../../mixins/system/fwupd.nix
    ../../mixins/system/swap32.nix
    ../../mixins/system/latest-kernel.nix
  ];
}

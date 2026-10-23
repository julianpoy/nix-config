{specialArgs, ...}:
specialArgs.nixpkgs-2605.lib.nixosSystem {
  inherit specialArgs;
  system = "x86_64-linux";
  modules = [
    ./disk-config.nix

    ./configuration.nix
    ./hardware-configuration.nix

    (import "${specialArgs.home-manager-2605}/nixos")
    ({...}: {home-manager.extraSpecialArgs = specialArgs;})
    (import ../../users/wesley {stateVersion = "25.05";})

    "${specialArgs.nixos-hardware}/framework/12-inch/13th-gen-intel"

    ../../mixins/shared/base
    ../../mixins/applications/dbeaver.nix
    ../../mixins/applications/discord.nix
    ../../mixins/applications/element.nix
    ../../mixins/applications/firefox.nix
    ../../mixins/applications/gimp.nix
    ../../mixins/applications/google-chrome.nix
    ../../mixins/applications/kenku-fm.nix
    ../../mixins/applications/libreoffice.nix
    ../../mixins/applications/logitech.nix
    ../../mixins/applications/nextcloud-desktop.nix
    ../../mixins/applications/obs.nix
    ../../mixins/applications/steam.nix
    ../../mixins/applications/vlc.nix
    ../../mixins/cli/fish.nix
    ../../mixins/cli/rclone.nix
    ../../mixins/system/appimage.nix
    ../../mixins/system/bluetooth.nix
    ../../mixins/system/fwupd.nix
    ../../mixins/system/garbage-collection.nix
    ../../mixins/system/latest-kernel.nix
    ../../mixins/system/swap16.nix
    ../../mixins/system/thermald.nix
    ../../mixins/system/xone.nix
    ../../mixins/system/yubikey.nix
    ../../mixins/applications/vscode.nix

  ];
}

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
    (import ../../users/julian {stateVersion = "25.05";})

    "${specialArgs.nixos-hardware}/framework/13-inch/intel-core-ultra-series3"

    ../../mixins/shared/base

    ../../mixins/applications/cura.nix
    ../../mixins/applications/darktable.nix
    ../../mixins/applications/dbeaver.nix
    ../../mixins/applications/discord.nix
    ../../mixins/applications/element.nix
    ../../mixins/applications/firefox.nix
    ../../mixins/applications/gimp.nix
    ../../mixins/applications/google-chrome.nix
    ../../mixins/applications/kenku-fm.nix
    ../../mixins/applications/libreoffice.nix
    ../../mixins/applications/lightcraft.nix
    ../../mixins/applications/logitech.nix
    ../../mixins/applications/nextcloud-desktop.nix
    ../../mixins/applications/obs.nix
    ../../mixins/applications/opera-flatpak.nix
    ../../mixins/applications/slack.nix
    ../../mixins/applications/spotify.nix
    ../../mixins/applications/steam.nix
    ../../mixins/applications/vlc.nix
    ../../mixins/applications/zoom-us.nix
    ../../mixins/cli/claude-code.nix
    ../../mixins/cli/coder.nix
    ../../mixins/cli/fish.nix
    ../../mixins/cli/github.nix
    ../../mixins/cli/litra-rs.nix
    ../../mixins/cli/neovim.nix
    ../../mixins/system/ambient-keyboard-backlight-plasma.nix
    ../../mixins/system/appimage.nix
    ../../mixins/system/attic-push.nix
    ../../mixins/system/bluetooth.nix
    ../../mixins/system/audio/airplay.nix
    ../../mixins/system/audio/framework-13-intel-core-ultra-series3-dolby-custom
    ../../mixins/system/audio/noise-suppression.nix
    ../../mixins/system/dictation.nix
    ../../mixins/system/fingerprint.nix
    ../../mixins/system/fwupd.nix
    ../../mixins/system/garbage-collection.nix
    ../../mixins/system/latest-kernel.nix
    ../../mixins/system/plasma-custom-acceleration
    ../../mixins/system/swap32.nix
    ../../mixins/system/thermald.nix
    ../../mixins/system/thunderbolt.nix
    ../../mixins/system/ucsi-resume-retry
    ../../mixins/system/xone.nix
    ../../mixins/system/yubikey.nix
  ];
}

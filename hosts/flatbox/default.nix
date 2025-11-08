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
    (import ../../users/juno {stateVersion = "25.05";})

    "${specialArgs.nixos-hardware}/framework/13-inch/7040-amd"

    ../../mixins/shared/base

    ../../mixins/applications/discord-flatpak.nix
    ../../mixins/applications/firefox.nix
    ../../mixins/applications/jetbrains/datagrip.nix
    ../../mixins/applications/jetbrains/gateway.nix
    ../../mixins/applications/jetbrains/idea-ultimate.nix
    ../../mixins/applications/opera-flatpak.nix
    ../../mixins/applications/vlc.nix
    ../../mixins/cli/coder.nix
    ../../mixins/cli/neovim.nix
    ../../mixins/system/amdtuning.nix
    ../../mixins/system/appimage.nix
    ../../mixins/system/bluetooth.nix
    ../../mixins/system/fwupd.nix
    ../../mixins/system/latest-kernel.nix
  ];
}

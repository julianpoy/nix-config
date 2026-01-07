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
    (import ../../users/tartarus {stateVersion = "25.05";})
    (import ../../users/tartarus-coderhost {stateVersion = "25.05";})

    ../../mixins/shared/base/default.headless.nix

    ../../mixins/cli/fish.nix
    ../../mixins/cli/neovim.nix
    ../../mixins/system/latest-kernel.nix
    ../../mixins/system/libvirt-kvm.nix
    ../../mixins/system/nvidia-for-server.nix
  ];
}

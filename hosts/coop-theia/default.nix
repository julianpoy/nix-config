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
    (import ../../users/coop {stateVersion = "25.05";})
    (import ../../users/coop-admin {stateVersion = "25.05";})
    (import ../../users/coop-cmeyer {stateVersion = "25.05";})

    ../../mixins/shared/base
    ../../mixins/shared/coop

    ../../mixins/system/nvidia.nix
  ];
}

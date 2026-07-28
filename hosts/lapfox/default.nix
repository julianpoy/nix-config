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
    (import ../../users/boushi {stateVersion = "25.05";})

    ../../mixins/shared/base
    ../../mixins/shared/boush

    ../../mixins/system/bluetooth.nix
  ];
}

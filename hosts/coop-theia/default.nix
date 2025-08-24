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
    (import ../../users/coop {stateVersion = "25.05";})
    (import ../../users/coop-admin {stateVersion = "25.05";})

    ../../mixins/base
    ../../mixins/firefox
    ../../mixins/steam
    ../../mixins/nvidia
    ../../mixins/xone
  ];
}

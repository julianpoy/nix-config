{specialArgs, ...}:
specialArgs.nixpkgs-2505.lib.nixosSystem {
  inherit specialArgs;
  system = "x86_64-linux";
  modules = [
    ./configuration.nix
    ./hardware-configuration.nix

    "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
   ./disk-config.nix

    (import "${specialArgs.home-manager-2505}/nixos")
    (import ../../users/coop {stateVersion = "25.05";})

    ../../mixins/base
    ../../mixins/steam
    ../../mixins/nvidia
  ];
}

{specialArgs, ...}:
specialArgs.nixpkgs-2511.lib.nixosSystem {
  inherit specialArgs;
  system = "x86_64-linux";
  modules = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./qcow.nix

    (import "${specialArgs.home-manager-2511}/nixos")
    ({...}: {home-manager.extraSpecialArgs = specialArgs;})
    (import ../../users/coder {stateVersion = "25.05";})

    ../../mixins/shared/base/default.headless.nix

    ../../mixins/cli/coder.nix
    ../../mixins/cli/fish.nix
    ../../mixins/cli/neovim.nix
    ../../mixins/system/max-user-watches-524288.nix
  ];
}

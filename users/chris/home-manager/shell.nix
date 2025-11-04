{
  specialArgs,
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ../../home-manager-mixins/fish-julianpoy.nix
  ];

  programs.fish.functions = {
  };
}

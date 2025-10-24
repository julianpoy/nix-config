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
    fxap = ''
      coder port-forward fxa2 --tcp 3030,3031,3035,9299,9090,37255,9000,1111,8290 $argv
    '';
  };
}

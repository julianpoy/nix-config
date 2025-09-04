{ config, pkgs, ... }:
let
  desiredColor = "A020F0";
in
{
  imports = [
    ./default.nix
    ./set-static-color.nix { _module.args.desiredColor = desiredColor; }
  ];
}

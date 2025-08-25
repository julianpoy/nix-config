{ config, specialArgs, pkgs, ... }:
{
  _module.args.pkgsUnstable = import specialArgs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    inherit (config.nixpkgs) config;
  };
}

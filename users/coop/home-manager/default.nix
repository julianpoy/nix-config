{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./gtk.nix
    ./packages.nix
  ];
}

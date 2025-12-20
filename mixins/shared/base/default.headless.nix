{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./boot.nix
    ./core.nix
    ./nixpkgs-unstable.nix
    ./networking.nix
    ./packages.nix
  ];
}

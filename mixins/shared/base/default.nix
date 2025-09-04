{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./nixpkgs-unstable.nix
    ./boot.nix
    ./core.nix
    ./desktop-core.nix
    ./desktop-kde.nix
    ./networking.nix
    ./packages.nix
  ];
}

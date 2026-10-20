{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./binary-cache.nix
    ./boot.nix
    ./core.nix
    ./home-manager-backups.nix
    ./nixpkgs-unstable.nix
    ./networking.nix
    ./packages.nix
    ./sops.nix
  ];
}

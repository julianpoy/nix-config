{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./nixpkgs-unstable.nix
    ./binary-cache.nix
    ./boot.nix
    ./core.nix
    ./desktop-core.nix
    ./desktop-kde.nix
    ./home-manager-backups.nix
    ./networking.nix
    ./packages.nix
    ./sops.nix
  ];
}

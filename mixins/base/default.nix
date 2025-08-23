{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./boot.nix
    ./core.nix
    ./desktop-core.nix
    ./desktop-kde.nix
    ./networking.nix
    ./packages.nix
  ];
}

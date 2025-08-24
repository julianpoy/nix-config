{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./ghostty.nix
    ./git.nix
    ./gtk.nix
    ./libvirt.nix
    ./nvim.nix
    ./packages.nix
    ./tmux.nix
  ];

  home-manager.backupFileExtension = "backup";
}

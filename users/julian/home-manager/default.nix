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
    ./shell.nix
    ./tmux.nix
  ];

  home-manager.backupFileExtension = "backup";
}

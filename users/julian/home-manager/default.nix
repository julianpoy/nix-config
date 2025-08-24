{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./git.nix
    ./gtk.nix
    ./libvirt.nix
    ./nvim.nix
    ./packages.nix
    ./tmux.nix
  ];

  home-manager.backupFileExtension = "backup";
}

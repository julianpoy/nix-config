{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./discord.nix
    ./ghostty.nix
    ./git.nix
    ./libvirt.nix
    ./nvim.nix
    ./packages.nix
    ./shell.nix
    ./tmux.nix
    ./yubikey-ssh.nix
  ];

  home-manager.backupFileExtension = "backup";
}

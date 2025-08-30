{
  pkgs,
  config,
  lib,
  ...
}: {
  home-manager.users.julian = {
    imports = [
      ../../home-manager-mixins/base
      ../../home-manager-mixins/discord
      ../../home-manager-mixins/ghostty-julianpoy
      ../../home-manager-mixins/git-sensible
      ../../home-manager-mixins/neovim-julianpoy
      ../../home-manager-mixins/tmux-julianpoy

      ./git.nix
      ./libvirt.nix
      ./shell.nix
      ./yubikey-ssh.nix
    ];
  };
}

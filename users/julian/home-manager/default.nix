{
  pkgs,
  config,
  lib,
  ...
}: {
  home-manager.users.julian = {
    imports = [
      ../../home-manager-mixins/base.nix
      ../../home-manager-mixins/ghostty-julianpoy.nix
      ../../home-manager-mixins/neovim-julianpoy.nix
      ../../home-manager-mixins/tmux-julianpoy.nix

      ./git.nix
      ./libvirt.nix
      ./shell.nix
      ./yubikey-ssh.nix
    ];
  };
}

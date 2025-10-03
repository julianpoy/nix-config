{
  pkgs,
  config,
  lib,
  ...
}: {
  home-manager.users.bardsko = {
    imports = [
      ../../home-manager-mixins/base
      ../../home-manager-mixins/discord
      ../../home-manager-mixins/ghostty-julianpoy
      ../../home-manager-mixins/git-sensible
      ../../home-manager-mixins/neovim-julianpoy
      ../../home-manager-mixins/tmux-julianpoy
      ../../home-manager-mixins/fish-julianpoy

      ./git.nix
    ];
  };
}

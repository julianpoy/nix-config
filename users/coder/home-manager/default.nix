{
  pkgs,
  config,
  lib,
  ...
}: {
  home-manager.users.coder = {
    imports = [
      ../../home-manager-mixins/ghostty-julianpoy
      ../../home-manager-mixins/git-sensible
      ../../home-manager-mixins/neovim-julianpoy
      ../../home-manager-mixins/fish-julianpoy
      ../../home-manager-mixins/tmux-julianpoy
    ];
  };
}

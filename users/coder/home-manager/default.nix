{
  pkgs,
  config,
  lib,
  ...
}: {
  home-manager.users.coder = {
    imports = [
      ../../home-manager-mixins/ghostty-julianpoy.nix
      ../../home-manager-mixins/git-sensible.nix
      ../../home-manager-mixins/neovim-julianpoy.nix
      ../../home-manager-mixins/fish-julianpoy.nix
      ../../home-manager-mixins/tmux-julianpoy.nix
    ];
  };
}

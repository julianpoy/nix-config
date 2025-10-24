{
  pkgs,
  config,
  lib,
  ...
}: {
  home-manager.users.bardsko = {
    imports = [
      ../../home-manager-mixins/base.nix
      ../../home-manager-mixins/ghostty-julianpoy.nix
      ../../home-manager-mixins/neovim-julianpoy.nix
      ../../home-manager-mixins/tmux-julianpoy.nix
      ../../home-manager-mixins/fish-julianpoy.nix

      ./git.nix
    ];
  };
}

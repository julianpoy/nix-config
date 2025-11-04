{
  pkgs,
  config,
  lib,
  ...
}: {
  home-manager.users.chris = {
    imports = [
      ../../home-manager-mixins/base.nix
      ../../home-manager-mixins/ghostty-julianpoy.nix
      ../../home-manager-mixins/neovim-julianpoy.nix
      ../../home-manager-mixins/tmux-julianpoy.nix

      ./git.nix
      ./shell.nix
    ];
  };
}

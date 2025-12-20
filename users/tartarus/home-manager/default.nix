{
  pkgs,
  config,
  lib,
  ...
}: {
  home-manager.users.tartarus = {
    imports = [
      ../../home-manager-mixins/git-sensible.nix
      ../../home-manager-mixins/neovim-julianpoy.nix
      ../../home-manager-mixins/tmux-julianpoy.nix
      ../../home-manager-mixins/fish-julianpoy.nix
    ];
  };
}

{
  pkgs,
  config,
  lib,
  ...
}: {
  home-manager.users.wesley = {
    imports = [
      ../../home-manager-mixins/base.nix
      ../../home-manager-mixins/ghostty-julianpoy.nix
      ../../home-manager-mixins/tmux-julianpoy.nix

      ./shell.nix
    ];
  };
}

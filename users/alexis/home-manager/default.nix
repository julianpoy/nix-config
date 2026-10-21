{
  pkgs,
  config,
  lib,
  ...
}: {
  home-manager.users.alexis = {
    imports = [
      ../../home-manager-mixins/base.nix
      ../../home-manager-mixins/ghostty-julianpoy.nix
      ../../home-manager-mixins/fish-julianpoy.nix
    ];
  };
}

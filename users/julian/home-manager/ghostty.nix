{ specialArgs, pkgs, lib, config, ... }:
{
  home-manager.users.julian = {
    xdg.configFile."ghostty/config".source = "${specialArgs.dotfiles}/ghostty.config";
  };
}

{
  specialArgs,
  pkgs,
  lib,
  config,
  ...
}: {
  xdg.configFile."ghostty/config".source = "${specialArgs.dotfiles}/ghostty.config";
}

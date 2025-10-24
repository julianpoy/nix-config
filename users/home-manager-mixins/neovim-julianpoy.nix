{
  specialArgs,
  pkgs,
  lib,
  config,
  ...
}: {
  xdg.configFile."nvim/init.lua".source = "${specialArgs.dotfiles}/init.lua";

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
  };
}

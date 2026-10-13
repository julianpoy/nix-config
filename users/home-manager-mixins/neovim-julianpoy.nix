{
  specialArgs,
  pkgs,
  lib,
  config,
  ...
}: {
  home.sessionVariables.EDITOR = "nvim";

  xdg.configFile."nvim/init.lua".source = "${specialArgs.dotfiles}/init.lua";

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
  };
}

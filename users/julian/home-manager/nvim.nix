{ specialArgs, pkgs, lib, config, ... }:
{
  home-manager.users.julian = lib.mkIf (config.programs.neovim.enable) {
    xdg.configFile."nvim/init.lua".source = "${specialArgs.dotfiles}/init.lua";
  };
}

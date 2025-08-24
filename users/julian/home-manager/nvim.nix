{ specialArgs, pkgs, lib, config, ... }:
{
  home-manager.users.julian = lib.mkIf (config.programs.neovim.enable) {
    programs.neovim.enable = true;
    xdg.configFile."nvim/init.lua".source = "${specialArgs.dotfiles}/init.lua";
  };
}

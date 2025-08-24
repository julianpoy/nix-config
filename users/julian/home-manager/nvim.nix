{ specialArgs, pkgs, ... }:
{
  programs.neovim.enable = true;

  # If your repo path is dotfiles/nvim/init.lua:
  xdg.configFile."nvim/init.lua".source =
    "${specialArgs.dotfiles}/nvim/init.lua";

  # If you actually have a full nvim/ directory, use this instead:
  # xdg.configFile."nvim" = {
  #   source = "${specialArgs.dotfiles}/nvim";
  #   recursive = true;
  # };
}

{ specialArgs, pkgs, ... }:
{

  home-manager.users.julian = {
  programs.neovim.enable = true;
  xdg.configFile."nvim/init.lua".source =
    "${specialArgs.dotfiles}/init.lua";
};

  # If you actually have a full nvim/ directory, use this instead:
  # xdg.configFile."nvim" = {
  #   source = "${specialArgs.dotfiles}/nvim";
  #   recursive = true;
  # };
}

{ specialArgs, pkgs, ... }:
{
  home-manager.users.julian = {
    xdg.configFile.".tmux.conf".source =
      "${specialArgs.dotfiles}/.tmux.conf";
    xdg.configFile.".tmate.conf".source =
      "${specialArgs.dotfiles}/.tmate.conf";
  };
}

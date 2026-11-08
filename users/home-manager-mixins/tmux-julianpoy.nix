{
  specialArgs,
  pkgs,
  ...
}: {
  home.file.".tmux.conf".source = "${specialArgs.dotfiles}/.tmux.conf";
}

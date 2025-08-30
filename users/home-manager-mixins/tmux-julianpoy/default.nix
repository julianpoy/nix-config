{
  specialArgs,
  pkgs,
  ...
}: {
  home.file.".tmux.conf".source = "${specialArgs.dotfiles}/.tmux.conf";
  home.file.".tmate.conf".source = "${specialArgs.dotfiles}/.tmate.conf";
}

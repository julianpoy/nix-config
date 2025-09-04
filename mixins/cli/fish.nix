{
  config,
  pkgs,
  ...
}: {
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    fish
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.hydro
    fzf
  ];
}

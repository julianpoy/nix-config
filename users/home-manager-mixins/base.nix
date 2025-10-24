{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./discord-no-update-prompt.nix
    ./git-sensible.nix
    ./steam-perf.nix
  ];
}

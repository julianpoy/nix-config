{
  config,
  pkgs,
  ...
}: {
  programs.neovim.enable = true;

  environment.systemPackages = with pkgs; [
    netcat
    curl
    gcc
    jq
    zip
    unzip
    htop
    tmux
    tmate
    vim
    python3
    python3Packages.pip
    python3Packages.pynvim
    fish
    powerline-fonts
    ripgrep
    fd
    gh
  ];
}

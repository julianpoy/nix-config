{
  config,
  pkgs,
  ...
}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    tmux
    tmate
    htop
    btop
    git
    nettools
    gnumake
    alejandra
    python311
    zip
    unzip
    jq

    usbutils
    pciutils
    hwinfo

    dnsutils
    cifs-utils
    wakeonlan
    ghostty
    qpwgraph
    ncdu
    powerline-fonts
    netcat
  ];
}

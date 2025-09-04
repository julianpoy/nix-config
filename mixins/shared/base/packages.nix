{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    tmux
    tmate
    htop
    btop-rocm
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
    killall
    ethtool
    iperf3
  ];
}

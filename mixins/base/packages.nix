{
  config,
  pkgs,
  ...
}: {
  # Flatpak is managed via nix-flatpak, but still requires the default flatpak to be enabled
  services.flatpak.enable = true;

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

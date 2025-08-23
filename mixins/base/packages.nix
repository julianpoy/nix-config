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
    htop
    btop
    git
    nettools
    gnumake
    alejandra
    python311

    usbutils
    pciutils
    hwinfo

    dnsutils
    cifs-utils
    wakeonlan
  ];
}

{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../applications/darktable.nix
    ../../applications/discord-flatpak.nix
    ../../applications/element.nix
    ../../applications/firefox.nix
    ../../applications/gimp.nix
    ../../applications/gparted.nix
    ../../applications/kitty.nix
    ../../applications/kenku-fm.nix
    ../../applications/libreoffice.nix
    ../../applications/mozilla-vpn.nix
    ../../applications/nextcloud-desktop.nix
    ../../applications/obs.nix
    ../../applications/plex-desktop-flatpak.nix
    ../../applications/slack.nix
    ../../applications/spotify.nix
    ../../applications/steam.nix
    ../../applications/vlc.nix
    ../../cli/coder.nix
    ../../cli/docker.nix
    ../../cli/fish.nix
    ../../cli/neovim.nix
    ../../system/appimage.nix
    ../../system/flatpak.nix
    ../../system/latest-kernel.nix
    ../../system/xone.nix
    ../../system/yubikey.nix
  ];

  users.users.root.openssh.authorizedKeys.keys = [
  ];
}

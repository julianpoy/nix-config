{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../system/flatpak.nix
  ];

  services.flatpak.packages = [
    {
      appId = "tv.plex.PlexDesktop";
      origin = "flathub";
      # Use `flatpak remote-info --log flathub tv.plex.PlexDesktop | less` to find latest commit.
      commit = "c9c8758410b59a1c285e66b1143a9a4f17d67b0e8943e34cd292268c57e24a59";
    }
  ];

  # The nixpkgs plex-desktop fails to launch under KDE at the moment
  # environment.systemPackages = with pkgs; [plex-desktop];
}

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
      commit = "8844286e7468f5edc3df2306bc68dcf2082515d61c706129816d5ccbbeed8c17";
    }
  ];

  # The nixpkgs plex-desktop fails to launch under KDE at the moment
  # environment.systemPackages = with pkgs; [plex-desktop];
}

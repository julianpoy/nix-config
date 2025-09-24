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
      appId = "com.valvesoftware.Steam";
      origin = "flathub";
      # Use `flatpak remote-info --log flathub com.discordapp.Discord | less` to find latest commit.
      commit = "a28933d177a1edd2960f0a48c0bb8bcfe994efec864c8dd6953fc49576b1e7d4";
    }
  ];
}

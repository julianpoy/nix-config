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
      appId = "com.discordapp.Discord";
      origin = "flathub";
      # Use `flatpak remote-info --log flathub com.discordapp.Discord | less` to find latest commit.
      commit = "12e5f7d25c49a58deea0b5c35007ed719aee1cccbb834188a590d5cfe2dcfe59";
    }
  ];

  # By default Discord Flatpak is sandboxed. We give it access to home so we can upload files and such.
  services.flatpak.overrides = {
    "com.discordapp.Discord".Context = {
      filesystems = [
        "home"
      ];
    };
  };

  # The default nixpkgs Discord version does not support Krisp
  # environment.systemPackages = with pkgs; [
  #   discord
  # ];
}

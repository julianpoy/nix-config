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
      commit = "b797446477949e5e15c979a016f37a75fa3274bedb0cb8072e1d5f12217a4d41";
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

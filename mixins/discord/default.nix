{
  config,
  pkgs,
  ...
}: {
  services.flatpak.packages = [
    {
      appId = "com.discordapp.Discord";
      origin = "flathub";
      # Use `flatpak remote-info --log flathub com.discordapp.Discord | less` to find latest commit.
      commit = "7ce95d01be462891d7886c5d134d478f27c9b0415de459cf04cd8fc5bc86478a";
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

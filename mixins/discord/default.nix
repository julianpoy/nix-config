{
  config,
  pkgs,
  ...
}: {
  services.flatpak.packages = [
    { appId = "com.discordapp.Discord"; origin = "flathub"; commit = "48e1c1a3c3be33890282b6f8c923e136f71a7ba6"; }
  ];

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

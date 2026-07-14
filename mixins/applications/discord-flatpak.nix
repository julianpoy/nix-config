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
      commit = "5b964188452f75cb254797d2a7373fd0dada7dd4eae0f7a427f598e99d9113ec";
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

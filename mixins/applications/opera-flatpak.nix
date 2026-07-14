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
      appId = "com.opera.Opera";
      origin = "flathub";
      # Use `flatpak remote-info --log flathub com.opera.Opera | less` to find latest commit.
      commit = "e3408d309006f358336caac7b7f84d459b74ae71d25875af31f875c60c650a10";
    }
  ];

  # By default Opera Flatpak is sandboxed. We give it access to home so we can upload files and such.
  services.flatpak.overrides = {
    "com.opera.Opera".Context = {
      filesystems = [
        "home"
      ];
    };
  };
}

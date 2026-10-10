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
      commit = "9121e7e933239a15ce25bdad7bb4cf81d3cc849df7f72f4e7b12a558755d1e07";
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

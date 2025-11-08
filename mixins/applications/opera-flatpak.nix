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
      commit = "7cd041dc5ff3cf571eefb19b21343c90c5155f87fa4d674f2c00bc6e4b47a46e";
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

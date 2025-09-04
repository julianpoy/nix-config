{
  config,
  pkgs,
  ...
}: {
  # WARNING: The default nixpkgs Discord version does not support Krisp
  # Use the discord-flatpak.nix config if you value ML noise supression

  environment.systemPackages = with pkgs; [
    discord
  ];
}

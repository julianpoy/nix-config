{
  pkgs,
  config,
  ...
}: {
  home-manager.users.julian.home.packages = with pkgs; [
  ];
}

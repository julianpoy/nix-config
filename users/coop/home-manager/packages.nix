{
  pkgs,
  config,
  ...
}: {
  home-manager.users.coop.home.packages = with pkgs; [
  ];
}

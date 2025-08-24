{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [ coder ];
}

{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (pkgs.callPackage ../../pkgs/kenku-fm {})
  ];
}

{
  config,
  pkgs,
  specialArgs,
  ...
}: {
  environment.systemPackages = [
    specialArgs.chromaforge.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}

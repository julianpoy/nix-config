{
  config,
  pkgs,
  specialArgs,
  ...
}: {
  environment.systemPackages = [
    specialArgs.lightcraft.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}

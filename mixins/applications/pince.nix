{
  config,
  pkgsUnstable,
  ...
}: {
  environment.systemPackages = [pkgsUnstable.pince];
}

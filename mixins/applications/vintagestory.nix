{
  config,
  pkgsUnstable,
  ...
}: {
  environment.systemPackages = with pkgsUnstable; [vintagestory];
}

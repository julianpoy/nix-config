{
  config,
  pkgsUnstable,
  ...
}: {
  environment.systemPackages = with pkgsUnstable; [zoom-us];
}

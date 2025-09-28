{
  config,
  pkgsUnstable,
  ...
}: {
  environment.systemPackages = with pkgsUnstable; [coder];
}

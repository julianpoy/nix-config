{
  config,
  pkgsUnstable,
  ...
}: {
  environment.systemPackages = with pkgsUnstable; [
    claude-code
  ];
}

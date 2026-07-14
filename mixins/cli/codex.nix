{
  config,
  pkgsUnstable,
  ...
}: {
  environment.systemPackages = with pkgsUnstable; [
    codex
  ];
}

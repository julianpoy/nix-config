{
  config,
  lib,
  pkgs,
  ...
}: {
  boot.loader.systemd-boot.memtest86.enable = true;
}

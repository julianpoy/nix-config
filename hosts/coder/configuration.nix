{
  config,
  lib,
  pkgs,
  ...
}: {
  # Cloud-init takes care of this for us and we should let it be dynamic
  # networking.hostName = "coder";

  system.stateVersion = "25.05";
}

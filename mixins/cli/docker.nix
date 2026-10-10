{
  config,
  lib,
  pkgs,
  ...
}: {
  virtualisation.docker.enable = true;
  virtualisation.docker.package =
    if lib.versionAtLeast pkgs.docker.version "29"
    then pkgs.docker
    else pkgs.docker_29;
}

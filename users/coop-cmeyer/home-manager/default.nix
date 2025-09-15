{
  pkgs,
  config,
  lib,
  ...
}: {
  home-manager.users.coop-cmeyer = {
    imports = [
      ../../home-manager-mixins/base
    ];
  };
}

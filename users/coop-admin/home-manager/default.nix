{
  pkgs,
  config,
  lib,
  ...
}: {
  home-manager.users.coopadmin = {
    imports = [
      ../../home-manager-mixins/base
    ];
  };
}

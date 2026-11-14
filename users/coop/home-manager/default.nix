{
  pkgs,
  config,
  lib,
  ...
}: {
  home-manager.users.coop = {
    imports = [
      ../../home-manager-mixins/base.nix
    ];

    xdg.configFile."kwalletrc".text = ''
      [Wallet]
      Enabled=false
    '';
  };
}

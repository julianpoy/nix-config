{
  options,
  pkgs,
  lib,
  ...
}: let
  backupScript = pkgs.writeShellScript "home-manager-backup.sh" ''
    backupPath="$HOME/.home-manager-backups/''${1#"$HOME"/}.$(date +%Y-%m-%d-%H%M%S)"
    mkdir -p "$(dirname "$backupPath")"
    mv "$1" "$backupPath"
  '';
in {
  config = lib.optionalAttrs (options.home-manager ? backupCommand) {
    home-manager.backupCommand = "${backupScript}";
  };
}

{ pkgs, ... }:

let
  steamDevFlagsScript = pkgs.writeShellScript "steam-dev-flags.sh" ''
    set -euo pipefail

    STEAM_DIR="$HOME/.steam/steam"
    CFG="$STEAM_DIR/steam_dev.cfg"

    THREADS="$(${pkgs.coreutils}/bin/nproc)"
    STEAM_THREADS=$(( THREADS - 4 ))
    if [ "$STEAM_THREADS" -lt 4 ]; then
      STEAM_THREADS=4
    fi

    if [ -e "$STEAM_DIR" ]; then
      cat > "$CFG" <<EOF
@nClientDownloadEnableHTTP2PlatformLinux 0
@fDownloadRateImprovementToAddAnotherConnection 1.1
unShaderBackgroundProcessingThreads $STEAM_THREADS
EOF
    fi
  '';
in
{
  systemd.user.services.steam-performance-dev-flags = {
    Unit = {
      Description = "Configure Steam developer flags for improved performance";
      # Only run if Steam's path exists (avoids first-boot issues)
      ConditionPathExists = "%h/.steam/steam";
    };

    Service = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = steamDevFlagsScript;
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}

{
  pkgs,
  lib,
  config,
  ...
}: {
  systemd.user.startServices = true;
  systemd.user.services.steam-performance-dev-flags = {
    Unit = {
      Description = "Configure Steam developer flags for improved performance";
      After = [ "graphical-session.target" ];
    };

    Service = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = ''
        ${pkgs.bash}/bin/bash -c '
          STEAM_DIR="$HOME/.steam/steam"
          CFG="$STEAM_DIR/steam_dev.cfg"
          THREADS=$(${pkgs.coreutils}/bin/nproc)
          STEAM_THREADS=$((THREADS - 4))

          # Ensure minimum of 4 threads
          if [ $STEAM_THREADS -lt 4 ]; then
            STEAM_THREADS=4
          fi

          if [ -e "$STEAM_DIR" ]; then
            cat > "$CFG" <<EOF
@nClientDownloadEnableHTTP2PlatformLinux 0
@fDownloadRateImprovementToAddAnotherConnection 1.1
unShaderBackgroundProcessingThreads $STEAM_THREADS
EOF
          fi
        '
      '';
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}

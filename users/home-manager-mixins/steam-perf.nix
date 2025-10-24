{
  pkgs,
  lib,
  config,
  ...
}: {
  home.file.".steam/steam/steam_dev.cfg".text = ''
  @fDownloadRateImprovementToAddAnotherConnection 1.1
  '';
  systemd.user.services.steam-dev-flags = {
    description = "Configure Steam developer flags for download behavior";
    wantedBy = [ "default.target" ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };

    script = ''
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
    '';
  };
}

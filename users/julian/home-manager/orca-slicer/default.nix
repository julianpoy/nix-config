{
  config,
  lib,
  ...
}: {
  home.activation.orcaSlicerPresets = lib.hm.dag.entryAfter ["writeBoundary"] ''
    run mkdir -p $VERBOSE_ARG "${config.xdg.configHome}/OrcaSlicer/user/default"
    run cp -r --no-preserve=mode $VERBOSE_ARG ${./presets}/. "${config.xdg.configHome}/OrcaSlicer/user/default/"
  '';
}

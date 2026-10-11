{
  config,
  pkgsUnstable,
  ...
}: {
  environment.systemPackages = [
    # Workaround for OrcaSlicer#15873
    (pkgsUnstable.symlinkJoin {
      name = "orca-slicer";
      paths = [pkgsUnstable.orca-slicer];
      nativeBuildInputs = [pkgsUnstable.makeWrapper];
      postBuild = ''
        wrapProgram $out/bin/orca-slicer --set WEBKIT_DISABLE_DMABUF_RENDERER 1
      '';
    })
  ];
}

{
  config,
  lib,
  ...
}: {
  nixpkgs.overlays = [
    (final: prev: {
      kdePackages = prev.kdePackages.overrideScope (kfinal: kprev: {
        kwin = kprev.kwin.overrideAttrs (old: {
          patches = (old.patches or []) ++ [./kwin-custom-acceleration-profiles.patch];
        });
      });
    })
  ];
}

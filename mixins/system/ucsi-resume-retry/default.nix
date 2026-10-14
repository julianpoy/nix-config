{
  config,
  lib,
  ...
}: {
  boot.kernelPatches = lib.optionals (lib.versionOlder config.boot.kernelPackages.kernel.version "7.4") [
    {
      name = "ucsi-allow-retries-of-resume-work";
      patch = ./ucsi-allow-retries-of-resume-work.patch;
    }
  ];
}

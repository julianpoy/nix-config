{
  config,
  lib,
  ...
}: {
  # Backport of a2463e239443 ("usb: typec: ucsi: allow retries of
  # ucsi_resume_work") from usb-next. Without it, the Framework 13 Pro EC can
  # time out SET_NOTIFICATION_ENABLE on resume ("failed to re-enable
  # notifications (-110)"), leaving UCSI broken; a later AC unplug while
  # suspended then hangs the next suspend. Expected upstream in 7.4.
  boot.kernelPatches = lib.optionals (lib.versionOlder config.boot.kernelPackages.kernel.version "7.4") [
    {
      name = "ucsi-allow-retries-of-resume-work";
      patch = ./ucsi-allow-retries-of-resume-work.patch;
    }
  ];
}

{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.btop = {
    enable = true;
    package = null;
    settings = {
      update_ms = 500;
      proc_per_core = true;
      proc_sorting = "cpu lazy";
    };
  };
}

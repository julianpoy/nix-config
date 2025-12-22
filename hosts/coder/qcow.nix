{ config, lib, pkgs, modulesPath, ... }: {
  system.build.qcow2 = import "${modulesPath}/../lib/make-disk-image.nix" {
    inherit lib config pkgs;
    diskSize = 20480;  # MB
    format = "qcow2";
    partitionTableType = "hybrid";
  };
}

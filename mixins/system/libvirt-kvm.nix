{
  config,
  pkgs,
  ...
}: {
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
    onShutdown = "suspend";
    onBoot = "start";
    parallelShutdown = 3;
  };
}

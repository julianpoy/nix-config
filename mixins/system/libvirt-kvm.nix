{
  config,
  pkgs,
  ...
}: let
  parallelSave = pkgs.writeShellApplication {
    name = "libvirt-parallel-save";
    runtimeInputs = [config.virtualisation.libvirtd.package pkgs.findutils pkgs.systemd];
    text = ''
      if [ "$(systemctl is-system-running || true)" != "stopping" ]; then
        exit 0
      fi

      virsh -c qemu:///system list --name \
        | xargs -r -n 1 -P ${toString config.virtualisation.libvirtd.parallelShutdown} \
          virsh -c qemu:///system managedsave || true
    '';
  };
in {
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

  systemd.services.libvirt-parallel-save = {
    description = "Save running libvirt guests in parallel on shutdown";
    wantedBy = ["multi-user.target"];
    after = ["libvirt-guests.service" "libvirtd.service"];
    wants = ["libvirtd.service"];
    restartIfChanged = false;
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.coreutils}/bin/true";
      ExecStop = "${parallelSave}/bin/libvirt-parallel-save";
      TimeoutStopSec = 0;
    };
  };
}

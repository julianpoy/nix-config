{
  config,
  lib,
  pkgs,
  ...
}: {
  # We initialize hostname via the script
  networking.hostName = "";

  boot.loader.grub.device = "/dev/vda";
  boot.loader.timeout = 0;
  boot.kernelParams = [ "console=ttyS0,115200n8" "console=tty0" "nokaslr" ];
  boot.growPartition = true;

  services.cloud-init = {
    enable = true;
    settings = {
      datasource_list = [ "NoCloud" ];
      cloud_init_modules = [
        "write-files"
        "users-groups"
      ];
    };
  };

  security.wrappers.coder = {
    source = "${pkgs.coder}/bin/coder";
    capabilities = "cap_net_admin+ep";
    owner = "root";
    group = "root";
  };

  systemd.services.coder-agent = {
    description = "Coder Agent";
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" "cloud-final.service" ];
    wants = [ "network-online.target" ];

    restartIfChanged = false;
    unitConfig = {
      ConditionPathExists = "/run/coder/agent-env"; # If we don't conditional on /run/coder/env this will try to run during image build
    };

    path = with pkgs; [
      git
      bash
      gawk
    ];

    serviceConfig = {
      Type = "exec";
      User = "coder";
      EnvironmentFile = "/run/coder/agent-env"; # Written by cloud-init
      ExecStart = "/run/wrappers/bin/coder agent";
      Restart = "always";
      RestartSec = "5s";
    };
  };

  system.stateVersion = "25.05";
}

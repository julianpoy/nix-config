{
  config,
  lib,
  pkgs,
  ...
}: {
  # We initialize hostname via the script
  # networking.hostName = "coder-uninitialized";

  boot.loader.grub.device = "/dev/vda";
  boot.kernelParams = [ "console=ttyS0,115200" ];

  fileSystems."/" = {
    autoResize = true;
  };

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

  systemd.services.coder-agent = lib.mkIf (!config.system.build ? qcow2) {
    description = "Coder Agent";
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" "cloud-final.service" ];
    wants = [ "network-online.target" ];
    
    serviceConfig = {
      Type = "exec";
      User = "coder";
      EnvironmentFile = "/run/coder/agent-env"; # Written by cloud-init
      ExecStart = "/run/wrappers/bin/coder agent";
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };

  system.stateVersion = "25.05";
}

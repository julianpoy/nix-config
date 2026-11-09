{
  config,
  lib,
  pkgs,
  ...
}: let
  mountOptions = [
    "credentials=${config.sops.secrets.asphodel-credentials.path}"
    "uid=julian"
    "gid=users"
    "file_mode=0644"
    "dir_mode=0755"
    "echo_interval=15"
    "noauto"
    "nofail"
    "_netdev"
    "x-systemd.mount-timeout=10s"
  ];

  mountPoints = [
    "/mnt/asphodel/jpoyourow"
    "/mnt/asphodel/jpoyourow-ssd0"
  ];

  asphodelAutomountToggle = pkgs.writeShellApplication {
    name = "asphodel-automount-toggle";
    runtimeInputs = [pkgs.bash pkgs.coreutils pkgs.systemd pkgs.util-linux];
    text = ''
      case "$2" in
        up | down | connectivity-change | dhcp4-change | dhcp6-change | vpn-up | vpn-down) ;;
        *) exit 0 ;;
      esac

      reachable=0
      for _ in 1 2 3; do
        if timeout 1 bash -c '</dev/tcp/10.0.4.4/445' 2>/dev/null; then
          reachable=1
          break
        fi
      done

      for path in ${lib.escapeShellArgs mountPoints}; do
        unit="$(systemd-escape --path --suffix=automount "$path")"
        if [ "$reachable" = 1 ]; then
          systemctl start "$unit"
        else
          if findmnt -n -t cifs --mountpoint "$path" >/dev/null; then
            umount -l -c "$path"
          fi
          systemctl stop "$unit"
        fi
      done
    '';
  };
in {
  options.julian.mounts.asphodel.enable = lib.mkEnableOption "julian's asphodel samba shares";

  config = lib.mkIf config.julian.mounts.asphodel.enable {
    sops.secrets.asphodel-credentials.sopsFile = ../../secrets/julian/asphodel.yaml;

    fileSystems."/mnt/asphodel/jpoyourow" = {
      device = "//10.0.4.4/jpoyourow";
      fsType = "cifs";
      options = mountOptions;
    };

    fileSystems."/mnt/asphodel/jpoyourow-ssd0" = {
      device = "//10.0.4.4/jpoyourow-ssd0";
      fsType = "cifs";
      options = mountOptions;
    };

    systemd.automounts = map (path: {where = path;}) mountPoints;

    networking.networkmanager.dispatcherScripts = [
      {source = lib.getExe asphodelAutomountToggle;}
    ];
  };
}

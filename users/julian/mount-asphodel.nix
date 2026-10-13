{
  config,
  lib,
  ...
}: let
  mountOptions = [
    "credentials=${config.sops.secrets.asphodel-credentials.path}"
    "uid=julian"
    "gid=users"
    "file_mode=0644"
    "dir_mode=0755"
    "noauto"
    "nofail"
    "_netdev"
    "x-systemd.automount"
    "x-systemd.idle-timeout=300"
    "x-systemd.mount-timeout=10s"
  ];
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
  };
}

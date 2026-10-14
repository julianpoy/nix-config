{
  fileSystems."/" = {
    device = "/dev/disk/by-partuuid/82954fb6-d517-419a-9d5d-0fac215feea5";
    fsType = "ext4";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-partuuid/f64d5b38-d5be-4594-8c34-f33b799c6488";
    fsType = "vfat";
    options = ["umask=0077"];
  };
}

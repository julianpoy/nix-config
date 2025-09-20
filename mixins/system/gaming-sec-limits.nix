{
  config,
  pkgs,
  ...
}: {
  systemd.user.extraConfig = "DefaultLimitNOFILE=32000";
  security.pam.loginLimits = [
    { domain = "*"; item = "nofile"; type = "-"; value = "32768"; }
    { domain = "*"; item = "memlock"; type = "-"; value = "32768"; }
  ];
}

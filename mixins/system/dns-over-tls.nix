{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../dnscache
  ];

  networking.nameservers = [
    "1.1.1.1#one.one.one.one"
    "1.0.0.1#one.one.one.one"
  ];

  services.resolved = {
    dnsovertls = "true";
  };
}

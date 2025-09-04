{
  config,
  pkgs,
  ...
}: {
  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
  };
}

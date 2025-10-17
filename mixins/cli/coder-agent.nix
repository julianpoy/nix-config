{
  config,
  pkgsUnstable,
  ...
}: {
  # Please keep in mind that this file is for a coder _host_, not a coder client

  environment.systemPackages = with pkgsUnstable; [coder];
  systemd.services.coder-agent = {
    description = "Coder agent";
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.coder}/bin/coder agent start --token \"$CODER_AGENT_TOKEN\"";
      Restart = "always";
    };
  };
}


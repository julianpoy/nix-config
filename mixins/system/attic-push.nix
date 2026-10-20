{
  config,
  pkgs,
  ...
}: let
  atticConfig = pkgs.writeTextDir "attic/config.toml" ''
    default-server = "tartarus"

    [servers.tartarus]
    endpoint = "https://attic.tartarus.cloud/"
    token-file = "${config.sops.secrets.attic-push-token.path}"
  '';
in {
  sops.secrets.attic-push-token.sopsFile = ../../secrets/attic/push-token.yaml;

  systemd.services.attic-watch-store = {
    wantedBy = ["multi-user.target"];
    wants = ["network-online.target"];
    after = ["network-online.target"];
    environment.XDG_CONFIG_HOME = "${atticConfig}";
    serviceConfig = {
      ExecStart = "${pkgs.attic-client}/bin/attic watch-store tartarus";
      Restart = "always";
      RestartSec = 30;
    };
  };
}

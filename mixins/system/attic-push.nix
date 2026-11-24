{
  config,
  lib,
  pkgs,
  ...
}: let
  atticConfig = pkgs.writeTextDir "attic/config.toml" ''
    default-server = "tartarus"

    [servers.tartarus]
    endpoint = "https://attic.tartarus.cloud/"
    token-file = "${config.sops.secrets.attic-push-token.path}"
  '';

  postBuildHook = pkgs.writeShellApplication {
    name = "attic-post-build-hook";
    runtimeInputs = [pkgs.systemd];
    text = ''
      read -r -a output_paths <<< "$OUT_PATHS"

      systemd-run --no-block --collect --quiet \
        --description="Push build outputs to attic" \
        --property=SyslogIdentifier=attic-push \
        --property=Restart=on-failure \
        --property=RestartSec=30 \
        --property=CPUSchedulingPolicy=idle \
        --property=IOSchedulingClass=idle \
        --setenv=XDG_CONFIG_HOME=${atticConfig} \
        ${lib.getExe pkgs.attic-client} push --no-closure tartarus "''${output_paths[@]}" || true
    '';
  };
in {
  sops.secrets.attic-push-token.sopsFile = ../../secrets/attic/push-token.yaml;

  nix.settings.post-build-hook = lib.getExe postBuildHook;
}

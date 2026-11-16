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

  precache = pkgs.writeShellApplication {
    name = "coder-attic-precache";
    runtimeInputs = [pkgs.nix pkgs.git pkgs.jq pkgs.attic-client];
    text = ''
      flake="github:julianpoy/nix-config"

      system=$(nix build --print-out-paths \
        --out-link "$STATE_DIRECTORY/system" \
        "$flake#nixosConfigurations.coder.config.system.build.toplevel")

      mapfile -t inputs < <(nix flake archive --json "$flake" | jq -r '.. | .path? // empty')

      attic push --ignore-upstream-cache-filter tartarus "$system" "''${inputs[@]}"
    '';
  };
in {
  sops.secrets.attic-push-token.sopsFile = ../../secrets/attic/push-token.yaml;

  nix.daemonCPUSchedPolicy = "idle";
  nix.daemonIOSchedClass = "idle";

  systemd.services.coder-attic-precache = {
    description = "Build the coder workspace system and push it to attic";
    wants = ["network-online.target"];
    after = ["network-online.target"];
    restartIfChanged = false;
    environment.XDG_CONFIG_HOME = "${atticConfig}";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${precache}/bin/coder-attic-precache";
      StateDirectory = "coder-attic-precache";
      CPUSchedulingPolicy = "idle";
      IOSchedulingClass = "idle";
    };
  };

  systemd.timers.coder-attic-precache = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      RandomizedDelaySec = "1h";
    };
  };
}

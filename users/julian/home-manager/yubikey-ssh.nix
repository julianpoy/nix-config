{
  lib,
  config,
  specialArgs,
  pkgs,
  ...
}: {
  # environment.shellInit = ''
  #   gpg-connect-agent /bye
  #   export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  # '';

  home-manager.users.julian = lib.mkIf (config.programs.gnupg.agent.enable) {
    # programs.ssh.startAgent = false;

    programs.gpg = {
      enable = true;
      publicKeys = [
        {source = ../CFF09DBE5C7B348781FCBF3272DC5D65A37D62C2.asc; trust = 5;}
      ];
    };
  };
}

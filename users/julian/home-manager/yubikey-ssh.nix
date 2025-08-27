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
    # This and the shellInit breaks Coder. Will have to figure out why, but no yubikey-ssh until then
    # programs.ssh.startAgent = false;

    programs.gpg = {
      enable = true;
      publicKeys = [
        {source = ../72DC5D65A37D62C2.asc; trust = 5;}
      ];
    };
  };
}

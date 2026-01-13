{
  lib,
  config,
  specialArgs,
  pkgs,
  ...
}: {
  programs.gpg = {
    enable = true;
    publicKeys = [
      {source = ../E251C9AAC164166E.asc; trust = 5;}
    ];
    scdaemonSettings = {
      disable-ccid = true;
    };
    settings = {
      # https://github.com/drduh/config/blob/master/gpg.conf
      personal-cipher-preferences = "AES256 AES192 AES";
      personal-digest-preferences = "SHA512 SHA384 SHA256";
      personal-compress-preferences = "ZLIB BZIP2 ZIP Uncompressed";
      default-preference-list = "SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed";
      cert-digest-algo = "SHA512";
      s2k-digest-algo = "SHA512";
      s2k-cipher-algo = "AES256";
      charset = "utf-8";
      fixed-list-mode = true;
      no-comments = true;
      no-emit-version = true;
      keyid-format = "0xlong";
      list-options = "show-uid-validity";
      verify-options = "show-uid-validity";
      with-fingerprint = true;
      require-cross-certification = true;
      no-symkey-cache = true;
      use-agent = true;
      throw-keyids = true;
    };
    # settings = {
    #   default-key = "CFF0 9DBE 5C7B 3487 81FC  BF32 72DC 5D65 A37D 62C2";
    #   default-recipient-self = true;
    #   auto-key-locate = "local,wkd,keyserver";
    #   keyserver = "hkps://keys.openpgp.org";
    #   auto-key-retrieve = true;
    #   auto-key-import = true;
    #   keyserver-options = "honor-keyserver-url";
    # };
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "$(gpgconf --list-dirs agent-ssh-socket)";
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableExtraSocket = true;
    pinentry = {
      package = pkgs.pinentry-qt;
    };
    defaultCacheTtl = 60;
    maxCacheTtl = 120;
    extraConfig = ''
      ttyname $GPG_TTY
    '';
    # defaultCacheTtl = 6*h;
    # defaultCacheTtlSsh = 6*h;
    # maxCacheTtl = 100*y; # effectively unlimited
    # maxCacheTtlSsh = 100*y; # effectively unlimited
    sshKeys = [ "685D10B3B97E4C0765DD7AB7A334C60FC505D6BB" ];
  };
}

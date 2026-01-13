{
  pkgs,
  config,
  ...
}: {
  # These are additions to the shared git-sensible mixin
  programs.git = {
    userName = "Chris Meyer";
    userEmail = "chrismeyer175@gmail.com";

    extraConfig = {
      commit.gpgsign = true;
      tag.gpgSign = true;
      user.signingkey = "0x72DC5D65A37D62C2";
      gpg.format = "openpgp";
    };
  };
}

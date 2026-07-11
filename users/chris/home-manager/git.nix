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
      user.signingkey = "0xE251C9AAC164166E";
      gpg.format = "openpgp";
    };
  };
}

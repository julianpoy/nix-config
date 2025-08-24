{
  pkgs,
  config,
  ...
}: {
  home-manager.users.julian.programs.git = {
    enable = true;
    userName = "Julian Poyourow";
    userEmail = "julian@poyourow.com";
    extraConfig.core.editor = "nvim";
    extraConfig.init.defaultBranch = "main";
    lfs.enable = true;

    extraConfig = {
      commit.gpgsign = true;
      tag.gpgSign = true;
      user.signingkey = "0x72DC5D65A37D62C2";
      gpg.format = "openpgp";
      push.autoSetupRemote = true;
    };
  };
}

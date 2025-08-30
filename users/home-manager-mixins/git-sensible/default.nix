{
  pkgs,
  config,
  lib,
  ...
}: {
  # It's recommended to set the following if you use this mixin:
  # - programs.git.userName
  # - programs.git.userEmail
  # See config in users/julianpoy/home-manager/git.nix for more

  programs.git = {
    enable = true;
    extraConfig.core.editor = (lib.mkIf (config.programs.neovim.enable) "nvim");
    extraConfig.init.defaultBranch = "main";
    lfs.enable = true;

    extraConfig = {
      push.autoSetupRemote = true;
    };
  };
}

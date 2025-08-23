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
  };
}

{
  pkgs,
  config,
  ...
}: {
  # These are additions to the shared git-sensible mixin
  programs.git = {
    userName = "Michael Botsko";
    userEmail = "mbotsko7@gmail.com";
  };
}

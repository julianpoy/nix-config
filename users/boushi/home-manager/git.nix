{
  pkgs,
  config,
  ...
}: {
  # These are additions to the shared git-sensible mixin
  programs.git = {
    userName = "Boushi";
    userEmail = "chris.gomez.1993@gmail.com";
  };
}

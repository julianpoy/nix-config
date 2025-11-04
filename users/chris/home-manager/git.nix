{
  pkgs,
  config,
  ...
}: {
  # These are additions to the shared git-sensible mixin
  programs.git = {
    userName = "Chris Meyer";
    userEmail = "chrismeyer175@gmail.com";
  };
}

{
  pkgs,
  config,
  ...
}: {
  # These are additions to the shared git-sensible mixin
  programs.git = {
    userName = "Wesley Huang";
    userEmail = "huangw1493@gmail.com";
  };
}

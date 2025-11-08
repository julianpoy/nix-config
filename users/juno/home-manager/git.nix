{
  pkgs,
  config,
  ...
}: {
  # These are additions to the shared git-sensible mixin
  programs.git = {
    userName = "Jonathan Nuno";
    userEmail = "jonathan_nuno@outlook.com";
  };
}

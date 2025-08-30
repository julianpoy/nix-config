{
  pkgs,
  lib,
  ...
}: {
  home.shellAliases = {
    gpo = "git push origin";
    gpoh = "git push origin HEAD";
    gp = "git pull origin HEAD";
    gf = "git fetch --all";
    gc = "git commit";
    gca = "git add .; and git commit";
    gs = "git status";
    ga = "git add";
    gaa = "git add .";
    gcb = "git checkout";
    gl = "git log";
    gd = "git diff";
    dc = "docker-compose";
    k = "kubectl";
  };

  # Different from the global fish enablement -- this is just for home-manager
  programs.fish.enable = true;
  programs.fish.functions = {
    setupstream = ''
      git branch --set-upstream-to=origin/(git rev-parse --abbrev-ref HEAD) (git rev-parse --abbrev-ref HEAD)
    '';
  };
}

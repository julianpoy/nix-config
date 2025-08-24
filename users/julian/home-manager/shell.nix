{ specialArgs, pkgs, lib, config, ... }:
{
  home-manager.users.julian = {
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

    programs.fish.functions = {
      fxap = ''
        coder port-forward fxa2 --tcp 3030,3031,3035,9299,9090,37255,9000,1111,8290 $argv
      '';
      setupstream = ''
        git branch --set-upstream-to=origin/(git rev-parse --abbrev-ref HEAD) (git rev-parse --abbrev-ref HEAD)
      '';
    };
  };
}

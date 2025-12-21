{stateVersion}: {
  pkgs,
  config,
  lib,
  ...
}: {
  users.users.coderhost = {
    isNormalUser = true;
    description = "Tartarus CoderHost";
    extraGroups = [
      (lib.mkIf (config.virtualisation.libvirtd.enable) "libvirtd")
    ];
    hashedPassword = "$y$j9T$ZHdWCHnnohruVTEP4TY89.$61hYSXoaloVODijDsccTyYnNZBjxDwCviqe6Un4TI3C";
  };

  users.users.coderhost.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7NqrUwo3KqmBWRWSAEBh2yuQtSgmSZYvHVikqA2ZZj+iyo6nRNSdDUhhZRPDDNKO1xn/xAU7BiRGyaQZE2K+6rsxaJUUcnwo4H1X50JQZoBPLc6uQKLOj30xLOoHQ93FH9T4kwd6Ya2WcpT8yQznCqV4JMKNYRsduoDaRWdZ58dN+QF+lRVNo9ExbhTuObWzCK3RMqug7iSPAmi5SkySjh0Api8jP8B4vee+c9CyGMIi2MnpwS5C+WPLUS0Dj2ICjVoE4MxHXBw3vlDFAPm2Q7sqlFpV+R7brJoIQHNtzLmZhDXHSweQ0vmMiG2FcysayFy9tabMtLdQzAUcLcNMUWlUVjFg57k8VPQaK+N7kmUvfWlXvBDBR1RzHbENafme0QQ+D1yByXOv57dkKxEnjAS7KwPP7s6w2zvP6je7AkmdFwHNXMgT14k5b7vx7lJhGynrHhT3mtMeO8vVgWjZNGWBtbbKH0/RXtDxlG38gj7YY3Bi8rlF/+QaXKwL8UrM= julianpoyourow@mozmac1"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDb9eoEYj/2rBzt0DKwANmNfmsYtN2YfdE6ycOYw7tRmQp1zoZPVTINRk67T+3Uz4OPUeEjTtEf2tbzUQRKcKt6V5P8GAZUhs2610Ml4mcWmeZE2EHPUnB8rC7tUyiI/RYP+imPgM9XOIyd4ktCCl96oCaHSSPo1ray79aaP+Ewekd0DVDAfUe8vvp0pEBtEd7gMw3sG6OiaiHiSzc+UfRXtYWoUswCkAc8WxEzlihYjfDLi5QZoa6lPVkk2smmgG6Gp53h3qv7zlw0ZSaNk4P0L1iQJBGKI7sifsiqAXvyYL5ZrqluQACSFRn9PUICeA87fn3bdbUWK+nsDUhw/aM1TVE1wqyLr6Y940SK55SWIOH20HLRNVptrSe0gKyBzJQlTp7xCBhxUs209lWazcLdRoOl+mcXm/uIyxTaMmokVJxLqfNB+EaX8ZeJqPNKqKuQacS2aAYWzoGJ9XVGLrTvL23SmMkC4IwX6ptYGY77c2H4xl+uwqHcnUIG/ZtRtMs= julian@mozmac2"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC78QpaoCDg4PZlvbTAqgLd5QNXSK0Ymew98TuaF1XaOIEjVmmv98L7g7NL7Vg2L/lqStIjT6DXFdoPOtThxLFU8+Ku44356NF67TTM9dVHrRl+GOOgfdt8N9NgewU3768vzc7j6LYcG5ZWlYb1916Ct6ewXADx4Hx29C+VNEbNmkCyrUXyByNdwf3RWN64fIEwVKL6uOyuTV/nn0VLC88mgpTXjD4iakRaP8TN9Ap781/dG+w0+b3OEm8UOflHv7q/vWjAGaCp4IRdsu84JzTpb293Vny2l79/pHTrOxlb4lKXAhutJKPKRpJnUP8A0cYEFLy17txUwyvxgCCZmI3PvRbCtM60HEQ5Dihwn/tOw3BI7pgKg0/uJvDWb1lrusXjzG+72SQHsZxSdDzOTnHUKxPfs/SdMGymvjsiuZhsr0q/fYfsHIw2a8lYmWiyVDUe8lHmcuNUsOadan6wFiE12ObSzyPiV+wTupDFsBzzqNq4SNp1Fs9dj7qb1bdRggk= coder-kube-access"
  ];

  home-manager.users.coderhost.home.stateVersion = stateVersion;
}

{stateVersion}: {
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./home-manager
  ];

  users.users.coop = {
    isNormalUser = true;
    description = "bawk";
    extraGroups = [
      "networkmanager"
    ];
    hashedPassword = "$y$j9T$hhNxV.Yd6CX1OJ90n1y4R1$vAFoWvMDoBQhxGgInw0UaJMgexNEqi6g7FZpjaphq/A";
  };

  users.users.coop.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7NqrUwo3KqmBWRWSAEBh2yuQtSgmSZYvHVikqA2ZZj+iyo6nRNSdDUhhZRPDDNKO1xn/xAU7BiRGyaQZE2K+6rsxaJUUcnwo4H1X50JQZoBPLc6uQKLOj30xLOoHQ93FH9T4kwd6Ya2WcpT8yQznCqV4JMKNYRsduoDaRWdZ58dN+QF+lRVNo9ExbhTuObWzCK3RMqug7iSPAmi5SkySjh0Api8jP8B4vee+c9CyGMIi2MnpwS5C+WPLUS0Dj2ICjVoE4MxHXBw3vlDFAPm2Q7sqlFpV+R7brJoIQHNtzLmZhDXHSweQ0vmMiG2FcysayFy9tabMtLdQzAUcLcNMUWlUVjFg57k8VPQaK+N7kmUvfWlXvBDBR1RzHbENafme0QQ+D1yByXOv57dkKxEnjAS7KwPP7s6w2zvP6je7AkmdFwHNXMgT14k5b7vx7lJhGynrHhT3mtMeO8vVgWjZNGWBtbbKH0/RXtDxlG38gj7YY3Bi8rlF/+QaXKwL8UrM= julianpoyourow@mozmac1"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDb9eoEYj/2rBzt0DKwANmNfmsYtN2YfdE6ycOYw7tRmQp1zoZPVTINRk67T+3Uz4OPUeEjTtEf2tbzUQRKcKt6V5P8GAZUhs2610Ml4mcWmeZE2EHPUnB8rC7tUyiI/RYP+imPgM9XOIyd4ktCCl96oCaHSSPo1ray79aaP+Ewekd0DVDAfUe8vvp0pEBtEd7gMw3sG6OiaiHiSzc+UfRXtYWoUswCkAc8WxEzlihYjfDLi5QZoa6lPVkk2smmgG6Gp53h3qv7zlw0ZSaNk4P0L1iQJBGKI7sifsiqAXvyYL5ZrqluQACSFRn9PUICeA87fn3bdbUWK+nsDUhw/aM1TVE1wqyLr6Y940SK55SWIOH20HLRNVptrSe0gKyBzJQlTp7xCBhxUs209lWazcLdRoOl+mcXm/uIyxTaMmokVJxLqfNB+EaX8ZeJqPNKqKuQacS2aAYWzoGJ9XVGLrTvL23SmMkC4IwX6ptYGY77c2H4xl+uwqHcnUIG/ZtRtMs= julian@mozmac2"
  ];

  home-manager.users.coop.home.stateVersion = stateVersion;
}

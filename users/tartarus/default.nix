{stateVersion}: {
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./home-manager
  ];

  users.users.tartarus = {
    isNormalUser = true;
    description = "Tartarus";
    extraGroups = [
      "networkmanager"
      "wheel"

      (lib.mkIf (config.virtualisation.libvirtd.enable) "libvirtd")
      (lib.mkIf (config.virtualisation.virtualbox.host.enable) "vboxusers")
      (lib.mkIf (config.virtualisation.docker.enable) "docker")
    ];
    hashedPassword = "$y$j9T$ZHdWCHnnohruVTEP4TY89.$61hYSXoaloVODijDsccTyYnNZBjxDwCviqe6Un4TI3C";
  };

  users.users.tartarus.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7NqrUwo3KqmBWRWSAEBh2yuQtSgmSZYvHVikqA2ZZj+iyo6nRNSdDUhhZRPDDNKO1xn/xAU7BiRGyaQZE2K+6rsxaJUUcnwo4H1X50JQZoBPLc6uQKLOj30xLOoHQ93FH9T4kwd6Ya2WcpT8yQznCqV4JMKNYRsduoDaRWdZ58dN+QF+lRVNo9ExbhTuObWzCK3RMqug7iSPAmi5SkySjh0Api8jP8B4vee+c9CyGMIi2MnpwS5C+WPLUS0Dj2ICjVoE4MxHXBw3vlDFAPm2Q7sqlFpV+R7brJoIQHNtzLmZhDXHSweQ0vmMiG2FcysayFy9tabMtLdQzAUcLcNMUWlUVjFg57k8VPQaK+N7kmUvfWlXvBDBR1RzHbENafme0QQ+D1yByXOv57dkKxEnjAS7KwPP7s6w2zvP6je7AkmdFwHNXMgT14k5b7vx7lJhGynrHhT3mtMeO8vVgWjZNGWBtbbKH0/RXtDxlG38gj7YY3Bi8rlF/+QaXKwL8UrM= julianpoyourow@mozmac1"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDb9eoEYj/2rBzt0DKwANmNfmsYtN2YfdE6ycOYw7tRmQp1zoZPVTINRk67T+3Uz4OPUeEjTtEf2tbzUQRKcKt6V5P8GAZUhs2610Ml4mcWmeZE2EHPUnB8rC7tUyiI/RYP+imPgM9XOIyd4ktCCl96oCaHSSPo1ray79aaP+Ewekd0DVDAfUe8vvp0pEBtEd7gMw3sG6OiaiHiSzc+UfRXtYWoUswCkAc8WxEzlihYjfDLi5QZoa6lPVkk2smmgG6Gp53h3qv7zlw0ZSaNk4P0L1iQJBGKI7sifsiqAXvyYL5ZrqluQACSFRn9PUICeA87fn3bdbUWK+nsDUhw/aM1TVE1wqyLr6Y940SK55SWIOH20HLRNVptrSe0gKyBzJQlTp7xCBhxUs209lWazcLdRoOl+mcXm/uIyxTaMmokVJxLqfNB+EaX8ZeJqPNKqKuQacS2aAYWzoGJ9XVGLrTvL23SmMkC4IwX6ptYGY77c2H4xl+uwqHcnUIG/ZtRtMs= julian@mozmac2"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDGT+/HbO4U2QvIohqu928XRjAVslgSfYmShL09dM1QcpEuV7c44THQBuZKiB0WEzPa08d36RWA9j6ZqgGCUYefTvf5mQE9dBGX7JaI8L7Ru33JzxHb7f1nD8hblGdXqyIGOnqszb6QBRhhN4oqBjCfNommUuF+XjWgDoYiLIXckA39wycXkOYQxvh2ySqbrp7biLuBdx5cwE93GzuKpUCXEAHnKrcdPahVZmThhbZGnwe+VYIHKN34q+FjkPgtf314yuuafN7RLM54jkpOhdDb+YEogeGlb3yx9BTLYLu7v5rZ1vxa1Q58ur6VCBOipkZlzAdPye6itvUe8CErXaH0bUZX4CFaLM80E4zv3dfvj9O1SGK5I8QobeU2lbmClx0NzG4A29rNu5ot+2hdZBhyXTtUIBkLADuPyQRNrO4LhVpCA5k/bsCIZhRQeJkAEPzgOeFovw9jZyhfBcgFKH+kn30GqWMaVQ2D42XJN+fN3bVy22uMv7kPm1SHPbgMBwAZ1nT48I7z0RJwYA+hIgbm+fY7hgmQj4/oAWqKZ/kLbFMYpx8AIT8BtPvm8QxiQ7MLfHXCZdWHEfi2P2gVhvUPbXHDjjWU61h3Nzg6FibS+5F2CxZIwUQn8a0VucsJ9jBHnQhCxi63xI4Z8kCe9ve+Gz8JMYNE1HD574Izt5f1nQ== openpgp:0x4CB55D53"
  ];

  home-manager.users.tartarus.home.stateVersion = stateVersion;
}

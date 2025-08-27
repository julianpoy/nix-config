{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../firefox
    ../logitech
    ../steam
    ../xone
  ];

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7NqrUwo3KqmBWRWSAEBh2yuQtSgmSZYvHVikqA2ZZj+iyo6nRNSdDUhhZRPDDNKO1xn/xAU7BiRGyaQZE2K+6rsxaJUUcnwo4H1X50JQZoBPLc6uQKLOj30xLOoHQ93FH9T4kwd6Ya2WcpT8yQznCqV4JMKNYRsduoDaRWdZ58dN+QF+lRVNo9ExbhTuObWzCK3RMqug7iSPAmi5SkySjh0Api8jP8B4vee+c9CyGMIi2MnpwS5C+WPLUS0Dj2ICjVoE4MxHXBw3vlDFAPm2Q7sqlFpV+R7brJoIQHNtzLmZhDXHSweQ0vmMiG2FcysayFy9tabMtLdQzAUcLcNMUWlUVjFg57k8VPQaK+N7kmUvfWlXvBDBR1RzHbENafme0QQ+D1yByXOv57dkKxEnjAS7KwPP7s6w2zvP6je7AkmdFwHNXMgT14k5b7vx7lJhGynrHhT3mtMeO8vVgWjZNGWBtbbKH0/RXtDxlG38gj7YY3Bi8rlF/+QaXKwL8UrM= julianpoyourow@julianpoyourow-99m29h"
  ];
}

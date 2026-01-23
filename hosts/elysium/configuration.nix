{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "elysium";

  networking.useDHCP = false;
  networking.bridges = {
    br0 = {
      interfaces = [ "enp14s0" ];
    };
  };
  networking.interfaces.br0.useDHCP = true;
  services.openssh.permitRootLogin = "yes";
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDGT+/HbO4U2QvIohqu928XRjAVslgSfYmShL09dM1QcpEuV7c44THQBuZKiB0WEzPa08d36RWA9j6ZqgGCUYefTvf5mQE9dBGX7JaI8L7Ru33JzxHb7f1nD8hblGdXqyIGOnqszb6QBRhhN4oqBjCfNommUuF+XjWgDoYiLIXckA39wycXkOYQxvh2ySqbrp7biLuBdx5cwE93GzuKpUCXEAHnKrcdPahVZmThhbZGnwe+VYIHKN34q+FjkPgtf314yuuafN7RLM54jkpOhdDb+YEogeGlb3yx9BTLYLu7v5rZ1vxa1Q58ur6VCBOipkZlzAdPye6itvUe8CErXaH0bUZX4CFaLM80E4zv3dfvj9O1SGK5I8QobeU2lbmClx0NzG4A29rNu5ot+2hdZBhyXTtUIBkLADuPyQRNrO4LhVpCA5k/bsCIZhRQeJkAEPzgOeFovw9jZyhfBcgFKH+kn30GqWMaVQ2D42XJN+fN3bVy22uMv7kPm1SHPbgMBwAZ1nT48I7z0RJwYA+hIgbm+fY7hgmQj4/oAWqKZ/kLbFMYpx8AIT8BtPvm8QxiQ7MLfHXCZdWHEfi2P2gVhvUPbXHDjjWU61h3Nzg6FibS+5F2CxZIwUQn8a0VucsJ9jBHnQhCxi63xI4Z8kCe9ve+Gz8JMYNE1HD574Izt5f1nQ== openpgp:0x4CB55D53"
  ];

  system.stateVersion = "25.05";
}

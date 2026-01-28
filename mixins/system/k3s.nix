{
  config,
  pkgs,
  ...
}: {
  networking.firewall.allowedTCPPorts = [
    6443 # k3s: required so that pods can reach the API server (running on port 6443 by default)
  ];
  networking.firewall.allowedUDPPorts = [
    8472 # flannel: required if using multi-node for inter-node networking
  ];
  services.k3s = {
    enable = true;
    role = "server";
    tokenFile = "/home/k3speeringtoken";
    serverAddr = "https://10.0.4.4:6443";
  };
}

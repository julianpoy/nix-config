{
  config,
  pkgs,
  ...
}: {
  networking.firewall.allowedTCPPorts = [
    10250 # kubelet: lets the server's metrics-server scrape this agent node
  ];
  networking.firewall.allowedUDPPorts = [
    8472 # flannel: required if using multi-node for inter-node networking
  ];
  services.k3s = {
    enable = true;
    package = pkgs.k3s_1_31; # pin to match asphodel server at v1.31.14+k3s1
    role = "agent";
    tokenFile = "/home/k3speeringtoken";
    serverAddr = "https://10.0.4.4:6443";
    # Asphodel's hostPath/local-PV needs to stay on Asphodel
    # Non-pv stuff can opt in with a toleration + `nodeSelector: { compute: "true" }`.
    extraFlags = [
      "--node-taint=dedicated=compute:NoSchedule"
      "--node-label=compute=true"
    ];
  };
}

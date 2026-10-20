{
  config,
  pkgs,
  ...
}: {
  nix.settings.extra-substituters = ["https://attic.tartarus.cloud/tartarus"];
  nix.settings.extra-trusted-public-keys = ["tartarus:gXsvKh1zrhDUhpfkiHkc6D2MbWBj1OoFNMPJv4mhVqk="];
  nix.settings.connect-timeout = 5;
}

# Secrets

Encrypted with [sops-nix](https://github.com/Mic92/sops-nix).

Hosts decrypt with their SSH host key (`/etc/ssh/ssh_host_ed25519_key`) at boot into `/run/secrets/`. People edit with their own GPG key (YubiKey works) or age key.

`nix develop` provides `sops`, `ssh-to-age`, and `gpg`.

## Editing a secret

```
nix develop
sops secrets/julian/example.yaml
```

## Using a secret in a host

```nix
sops.secrets.example = {
  sopsFile = ../../secrets/julian/example.yaml;
  owner = "julian";
};
```

The value of the `example` key is available at `config.sops.secrets.example.path`.

## Adding a host

Generate the host key before installing so the machine can decrypt on first boot:

```
mkdir -p /tmp/NAME_OF_HOST/etc/ssh
ssh-keygen -t ed25519 -N "" -C "root@NAME_OF_HOST" -f /tmp/NAME_OF_HOST/etc/ssh/ssh_host_ed25519_key
ssh-to-age < /tmp/NAME_OF_HOST/etc/ssh/ssh_host_ed25519_key.pub
```

1. Add the printed `age1...` key under `hosts:` in `.sops.yaml` and to the rules the host should receive.
2. Re-encrypt the affected files: `sops updatekeys secrets/julian/*.yaml`.
3. During install, copy the key in before `nixos-install`: `sudo cp -a /tmp/NAME_OF_HOST/etc/ssh /mnt/etc/`
4. Delete `/tmp/NAME_OF_HOST`.

For an already-installed host, run `ssh-to-age < /etc/ssh/ssh_host_ed25519_key.pub` on it instead of the steps above.

## Adding a user

1. Commit your public GPG key to `users/<name>/` (as with `users/julian/`), or run `age-keygen`.
2. Add the fingerprint (or `age1...` key) under `users:` in `.sops.yaml`.
3. Add a `secrets/<name>/.*` rule and your hosts.

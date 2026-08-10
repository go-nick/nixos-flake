# nixos-flake

## layout
```

flake/
├── flake.nix                            # defines nixosConfigurations per host
├── common/                              # shared modules, imported by every host
├── hosts/
│   └── <hostname>/                      # easy-to-remember name of the machine
│       ├── configuration.nix            # host-specific: hostname, IP, k3s, etc.
│       └── hardware-configuration.nix
└── Makefile

```

Sensitive values always outside the repo and properly encrypted.

## Usage

```(bash)
make help
```

## Adding a new host

1. mkdir hosts/[name]
2. Copy configuration.nix + hardware-configuration.nix from /etc/nixos on that machine
3. Add a nixosConfigurations.(name) entry in flake.nix
4. Add matching secrets/(name).nix (SSH keys, host-specific values) outside this repo
5. Add (name)-build/(name)-switch targets to the Makefile

## Requirements

- NixOS with flakes enabled
- secrets/ directory present locally (Syncthing-synced, see above)

## Warning

Running `sudo nixos-rebuild switch` **without** `--flake` silently ignores this repo entirely — it falls back to reading `/etc/nixos/configuration.nix` directly, which still exists as stale, unmanaged leftovers from before this flake setup. You won't get an error; you'll just activate the wrong, outdated config with no indication anything went sideways.

Always use the Makefile targets (`make beelink-master-switch`) instead of typing `nixos-rebuild` by hand, or always include `--flake /path/to/flake#hostname` explicitly if you do.

### Read the Warning!

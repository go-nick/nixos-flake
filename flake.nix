{
  description = "Nick's homelab NixOS configs";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations.beelink-master = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./hosts/beelink-master/configuration.nix ];
    };
    nixosConfigurations.old-white-worker = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./hosts/old-white-worker/configuration.nix ];
    };
  };
}

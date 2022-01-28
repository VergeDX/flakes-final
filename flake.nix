{
  inputs = {
    nixos.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, ... }@inputs: with inputs;
    flake-utils.lib.eachDefaultSystem (system: {
      packages.nixosConfigurations."NixOS-RoT" = nixos.lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };
    });
}

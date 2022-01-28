{
  inputs = {
    nixos.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, ... }@inputs: with inputs;
    flake-utils.lib.eachDefaultSystem (system: {
      packages.nixosConfigurations."NixOS-RoT" = nixos.lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ]
          ++ [ home-manager.nixosModules.home-manager ]
          ++ [{ home-manager.users."vanilla" = import ./home.nix; }];
      };
    });
}

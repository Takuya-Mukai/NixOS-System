{
  description = "NixOS system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # driver for hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    # xremap.url = "github:xremap/nix-flake";
  };

  outputs = { self, ...}@inputs: {
  # outputs = inputs: {
    nixosConfigurations = {
      m75q = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./m75q/configuration.nix
        ];
        specialArgs = {
          inherit inputs;
        };
      };
      vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./vm/configuration.nix
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
  };
}

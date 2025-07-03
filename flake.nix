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
    xremap.url = "github:xremap/nix-flake";

    # settings for hyprland
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    Hyprspace = {
      url = "github:KZDKM/Hyprspace";
      # Hyprspace uses latest Hyprland. We declare this to keep them in sync.
      inputs.hyprland.follows = "hyprland";
    };
    astal.url = "github:aylur/astal";
    ags.url = "github:aylur/ags";
  };

  outputs = { self, ...}@inputs: {
  # outputs = inputs: {
    nixosConfigurations = {
      # m75q = inputs.nixpkgs.lib.nixosSystem {
      #   system = "x86_64-linux";
      #   modules = [
      #     ./m75q/configuration.nix
      #     inputs.home-manager.nixosModules.home-manager
      #   ];
      #   specialArgs = {
      #     inherit inputs;
      #   };
      # };
      vm = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./vm/configuration.nix
          inputs.home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
  };
}

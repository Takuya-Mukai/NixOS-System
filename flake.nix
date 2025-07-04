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


  # outputs = { self, nixpkgs, home-manager, ... }@inputs:
  #   let
  #     # 1. 管理したいホスト名と、それぞれが使う設定ファイルのパスを定義
  #     hosts = {
  #       m75q = ./profiles/m75q/configuration.nix;
  #       vm = ./profiles/vm/configuration.nix;
  #       mini = ./profiles/mini/configuration.nix;
  #     };
  #
  #     # 2. nixosSystemを生成するための共通のロジックを関数として定義
  #     mkSystem = configPath: nixpkgs.lib.nixosSystem {
  #       system = "x86_64-linux";
  #       modules = [
  #         configPath  # <- 各ホスト固有の設定ファイル
  #         home-manager.nixosModules.home-manager # <- 共通のモジュール
  #       ];
  #       specialArgs = { inherit inputs; }; # <- 共通の引数
  #     };
  #
  #   in
  #   {
  #     # 3. `hosts`の各要素に対して`mkSystem`関数を適用し、nixosConfigurationsを生成
  #     nixosConfigurations = nixpkgs.lib.mapAttrs (hostname: configPath: mkSystem configPath) hosts;
  #   };
  outputs = { self, ...}@inputs: {
    nixosConfigurations = {
      m75q = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./profiles/m75q/configuration.nix
          inputs.home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          inherit inputs;
        };
      };
      vm = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./profiles/vm/configuration.nix
          inputs.home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          inherit inputs;
        };
      };
      mini = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./profiles/mini/configuration.nix
          inputs.home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
  };
}

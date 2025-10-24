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
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      # 1. 管理したいホスト名と、それぞれが使う設定ファイルのパスを定義
      hosts = {
        m75q = ./profiles/m75q/configuration.nix;
        vm = ./profiles/vm/configuration.nix;
        mini = ./profiles/mini/configuration.nix;
        thinkpad = ./profiles/thinkpad/configuration.nix;
      };

      # 2. nixosSystemを生成するための共通のロジックを関数として定義
      mkSystem =
        configPath:
        inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ configPath ];
          specialArgs = { inherit inputs; }; # <- 共通の引数
        };

    in
    {
      # 3. `hosts`の各要素に対して`mkSystem`関数を適用し、nixosConfigurationsを生成
      nixosConfigurations = nixpkgs.lib.mapAttrs (hostname: configPath: mkSystem configPath) hosts;
    };
}

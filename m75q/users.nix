# /etc/nixos/modules/users.nix
{ config, pkgs, inputs, ... }:

{
  # Home ManagerをNixOSモジュールとして有効化
  imports = [ home-manager.nixosModules.home-manager ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  # ユーザーの定義
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh; # デフォルトシェルなど
  };

  # ここでは taku ユーザーに Home Manager を使うことだけを伝える
  # 具体的な設定は、ユーザー自身のFlakeで管理される
  home-manager.users.taku = {
    # 空にしておくか、システムワイドで共通の設定のみ記述
  };
}

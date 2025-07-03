# /etc/nixos/modules/users.nix
{ config, pkgs, inputs, ... }:

{
  # Home ManagerをNixOSモジュールとして有効化
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";

  # ユーザーの定義
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirt" ];
    shell = pkgs.zsh; # デフォルトシェルなど
  };

  # ここでは user ユーザーに Home Manager を使うことだけを伝える
  # 具体的な設定は、ユーザー自身のFlakeで管理される
  # home-manager.users.user = {
  #   # 空にしておくか、システムワイドで共通の設定のみ記述
  # };
}

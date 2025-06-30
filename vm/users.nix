# /etc/nixos/modules/users.nix
{ config, pkgs, inputs, ... }:

{
  # ユーザーの定義
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirt" ];
    shell = pkgs.zsh; # デフォルトシェルなど
  };

  # ここでは user ユーザーに Home Manager を使うことだけを伝える
  # 具体的な設定は、ユーザー自身のFlakeで管理される
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.user = { home.stateVersion = "25.05"};
}

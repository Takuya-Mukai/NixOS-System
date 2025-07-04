# ~/dotfiles/linux/home.nix
{ pkgs, ... }:

{
  imports = [
    ../modules/common.nix
    ../modules/gui.nix
    ../modules/localization/fcitx5.nix
    ../modules/theme/default.nix
    ../modules/wayland/core.nix
    ../modules/wayland/wlogout/default.nix
    ../modules/wayland/hypr/default.nix
    # ./sway.nix
    # ./waybar.nix
  ];

  # home-managerの基本設定
  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "25.05";
}

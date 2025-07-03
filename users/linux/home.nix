# ~/dotfiles/linux/home.nix
{ pkgs, ... }:

{
  imports = [
    ../common.nix
    ./fcitx5.nix
    ./gtk.nix
    ./qt/default.nix
    ./wlogout/default.nix
    ./wm.nix
    ./gui.nix
    ./hyprland.nix
    ./hyprpanel.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./qt/default.nix
    ./wlogout/default.nix
    ./hyprpaper.nix
    ./hyprland-monitor.nix
    # ./sway.nix
    # ./waybar.nix
  ];

  # home-managerの基本設定
  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "25.05";
}

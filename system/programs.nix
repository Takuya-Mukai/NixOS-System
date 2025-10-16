# modules/shell/zsh.nix
{ config, pkgs, ... }:

{
  programs = {
    wireshark = {
      enable = true;
      dumpcap.enable = true;
    };
    zsh.enable = true;
    git.enable = true;
    neovim = {
      enable = true;
      # defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
    adb.enable = true;
    tmux.enable = true;
    bat.enable = true;
    weylus = {
      enable = true;
      users = [ "user" ];
      openFirewall = true;
    };
    sway = {
      enable = true;
      xwayland.enable = true;
    };
    hyprland = {
      enable = true;
      # portalPackages = true;
      # xwayland.enable = true;
    };
    # hyprlock.enable = true;
  };
  # services.hypridle.enable = true;
}

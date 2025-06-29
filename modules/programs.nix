# modules/shell/zsh.nix
{ config, pkgs, ... }:

{
  programs = {
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
      users = [ user ];
      openFirewall = true;
    };
  };
}

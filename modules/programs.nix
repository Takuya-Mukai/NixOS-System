# modules/shell/zsh.nix
{ config, pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
    };
    git = {
      enable = true;
    };
    neovim = {
      enable = true;
      # defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };

  services.tailscale.enable = true;
  networking.firewall = {
    enable = true;
    trustedInterfaces = ["tailscale0"];
    allowedUDPPorts = [config.services.tailscale.port];
  };
}

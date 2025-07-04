{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    fontPackages = with pkgs; [
      ibm-plex
      moralerspace-hwnf
    ];
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}

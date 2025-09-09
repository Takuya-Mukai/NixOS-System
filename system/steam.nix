{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    fontPackages = with pkgs; [
      ibm-plex
      moralerspace
    ];
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}

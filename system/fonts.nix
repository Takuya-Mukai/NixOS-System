{ config, pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      ibm-plex
      moralerspace
      nerd-fonts.fira-code
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = ["IBM Plex Serif"];
        sansSerif = ["IBM Plex Sans JP"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}

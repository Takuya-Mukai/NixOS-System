{ config, pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      ibm-plex
      moralerspace-hwnf
      nerd-fonts.fira-code
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = ["IBM Plex Serif"];
        sansSerif = ["IBM Plex Sans JP"];
        monospace = ["Moralerspace Argon HWNF"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}

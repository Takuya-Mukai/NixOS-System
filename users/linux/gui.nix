# install obsidian and chromium with home-manager
{ config, pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    obsidian
    inputs.zen-browser.packages.${system}.specific
    anki-bin
    spotify
    webcord
    slack
    rustdesk
    freetube
    bitwarden-cli
    calibre
    inkscape
    mpv
    zathura
    qalculate-gtk
    bottle
    ffmpegthumbnailer
    android-file-transfer
    isoimagewriter
    nextcloud-client
    showmethekey
    cheese
    network-manager-applet
    mission-center
    kdePackages.kalgebra
    ellyfin-mpv-shim
  ];
  # Enable the GUI applications to run in the home-manager environment
  xdg.enable = true;
  # Optional: Set up a desktop entry for Obsidian
  programs = {
    chromium.enable = true;
    thunar.enable = true;
    thunar.plugins = with pkgs; [
      xfce.thunar-archive-plugin
      xfce.thunar-media-tags-plugin
    ];
    weylus.enable = true;
  };

}

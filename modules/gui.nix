# install obsidian and chromium with home-manager
{ config, pkgs, inputs, ... }:
{
  programs.chromium.enable = true;
  home.packages = with pkgs; [
    obsidian
    inputs.zen-browser.packages.${system}.specific
    anki-bin
    spotify
    webcord
    slack
    # rustdesk
    freetube
    bitwarden-cli
    calibre
    inkscape
    mpv
    zathura
    qalculate-gtk
    bottles
    ffmpegthumbnailer
    android-file-transfer
    isoimagewriter
    nextcloud-client
    showmethekey
    cheese
    networkmanagerapplet
    mission-center
    kdePackages.kalgebra
    jellyfin-mpv-shim
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin

    (pkgs.makeDesktopItem {
      name = "Messenger";
      desktopName = "Messenger";
      exec = "${pkgs.chromium}/bin/chromium --app=https://messenger.com";
      icon = "fbmessenger";
      categories = [ "Network" "InstantMessaging" ];
    })
  ];
  # Enable the GUI applications to run in the home-manager environment
  xdg.enable = true;
  # Optional: Set up a desktop entry for Obsidian
  xdg.configFile."electron-flags.conf".text = ''
    --enable-features=WaylandWindowDecorations
    --enable-features=WebRTCPipeWireCapturer
    --enable-features=UseOzonePlatform
    --ozone-platform=wayland
    --wayland-text-input-version=3
    --enable-wayland-ime
  '';
  xdg.configFile."chromium-flags.conf".text = ''
    --enable-features=UseOzonePlatform
    --ozone-platform-hint=wayland
    --wayland-text-input-ersion=3
    --enable-wayland-ime
    --restore-last-session
  '';
}

# ~/dotfiles/linux/wm.nix
{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    # inputs.quickshell.packages.x86_64-linux.default
    sherlock-launcher
    wlvncc
    nwg-displays
    pwvucontrol
    wayvnc
    libsForQt5.xwaylandvideobridge
    wf-recorder
    wl-clipboard
    helvum
    slurp
    swappy
    nwg-drawer
    grim
    foot
  ];
  services.copyq.enable = true;
  xdg.configFile."foot/foot.ini" = {
    source = ../modules/config/foot/foot.ini;
  };
  xdg.configFile."sherlock" = {
    source = ../modules/config/sherlock;
    recursive = true;
  };
}

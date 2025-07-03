{ inputs, pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprfocus
      inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    ];
  };
  programs.hyprlock.enable = true;
  services = {
    hypridle.enable =true;
    hyprpaper.enable = true;
    hyprpolkitagent.enable = true;
  };

  xdg.configFile."hypr" = {
    source = ../modules/config/hypr;
    recursive = true;
    force = true;
  };
}

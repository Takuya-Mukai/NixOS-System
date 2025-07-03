{ config, pkgs, inputs, ...}:
{
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.graphics.enable = true;
  programs.hyprland.enable = true;
}

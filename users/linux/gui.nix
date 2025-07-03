# install obsidian and chromium with home-manager
{ config, pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    obsidian
    inputs.zen-browser.packages.${system}.specific
  ];
  # Enable the GUI applications to run in the home-manager environment
  xdg.enable = true;
  # Optional: Set up a desktop entry for Obsidian
  programs.chromium.enable = true;
}

{ config, pkgs, inputs, ... }:
{
  nixvim-config = import ./nixvim-config.nix;
  programs.nixvim = nixvim-config.settings;
}

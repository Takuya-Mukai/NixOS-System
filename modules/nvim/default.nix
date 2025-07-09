{ config, pkgs, inputs, ... }:
{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  nixvim-config = import ./nixvim-config.nix;
  programs.nixvim = nixvim-config.settings;
}

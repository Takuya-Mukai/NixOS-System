{ config, pkgs, inputs, ... }:
let
  nixvim-config = import ./nixvim-config.nix;
in
{
  programs.nixvim = nixvim-config.settings;
}

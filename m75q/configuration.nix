# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./hardware.nix
      ./users.nix

      # core systems
      ../modules/core.nix
      ../modules/locale.nix
      ../modules/fonts.nix
      ../modules/programs.nix
      ../modules/services.nix
      ../modules/virtualisation.nix

      inputs.nixos-hardware.nixosModules.common-cpu-amd
      inputs.nixos-hardware.nixosModules.common-pc-ssd
    ];
}

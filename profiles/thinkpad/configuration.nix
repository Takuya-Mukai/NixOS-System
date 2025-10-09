# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./hardware.nix
    ./users.nix

    # core systems
    ../../system/core.nix
    ../../system/fonts.nix
    ../../system/programs.nix
    ../../system/locale.nix
    ../../system/services.nix
    ../../system/virtualisation-intel.nix
    ../../system/keyboard.nix
    # ../../system/steam.nix
    ../../system/sound.nix
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];
}

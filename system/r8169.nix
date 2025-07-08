{ config, pkgs, ... }:

{
  boot.blacklistedKernelModules = [ "r8169" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.rtl8168 ];
  boot.kernelModules = [ "r8168" ];
}

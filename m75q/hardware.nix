{ config, pkgs, inputs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxpackages_latest;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    extraModulesPackages = [ config.boot.kernelPackages.r8168 ];
    blacklistedKernelModules = [ "r8169" ];
  };

  hardware.cpu.amd.updateMicrocode = true;
  hardware.bluetooth.enable = true;
  networking.hostName = "m75q";
}

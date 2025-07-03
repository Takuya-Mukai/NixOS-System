{ config, pkgs, inputs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    extraModulePackages = [ config.boot.kernelPackages.r8168 ];
    blacklistedKernelModules = [ "r8169" ];
  };

  hardware.cpu.amd.updateMicrocode = true;
  hardware.bluetooth.enable = true;
  networking.hostName = "m75q";
}

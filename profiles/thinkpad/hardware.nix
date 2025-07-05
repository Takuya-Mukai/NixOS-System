{ config, pkgs, inputs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  # Use latest kernel.
  hardware.cpu.amd.updateMicrocode = true;
  hardware.bluetooth.enable = true;
  networking.hostName = "thinkpad";

  # setting for clipboard
  services.spice-vdagentd.enable = true;
}

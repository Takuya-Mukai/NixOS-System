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
  hardware.enableAllFirmware = true;
  networking.hostName = "m75q";

  # setting for clipboard
  services.spice-vdagentd.enable = true;
  networking.interfaces.enp2s0f1.mtu = 1340;
}

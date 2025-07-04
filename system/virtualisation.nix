{ config, pkgs, inputs, ... }:
{
  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };

  programs.virt-manager.enable = true;

}

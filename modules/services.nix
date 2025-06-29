{ config, pkgs, ... }:
{
  services = {
    blueman.enable = true;
    polkit-gnome.enable = true;
    tailscale.enable = true;
  };
  networking.firewall = {
    enable = true;
    trustedInterfaces = ["tailscale0"];
    allowedUDPPorts = [config.services.tailscale.port];
  };
}

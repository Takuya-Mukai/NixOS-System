{ config, pkgs, ... }:
{
  services = {
    blueman.enable = true;
    tailscale.enable = true;
  };
  networking = {
    firewall = {
      enable = true;
      trustedInterfaces = ["tailscale0"];
      allowedUDPPorts = [config.services.tailscale.port];
      allowedTCPPorts = [ 22 ];
    };
    nftables.enable = true;
  };
}

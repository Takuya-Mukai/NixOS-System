{ config, pkgs, ... }:
{
  services = {
    blueman.enable = true;
    tailscale.enable = true;
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };
  };
  networking = {
    firewall = {
      enable = true;
      trustedInterfaces = ["tailscale0" "virbr0"];
      allowedUDPPorts = [config.services.tailscale.port];
      allowedTCPPorts = [ 22 ];
      # option for tailscale exitnode
      checkReversePath = "loose";
      # port for kde connect
      allowedTCPPortRanges = [
      	{ from = 1714; to = 1764; }
      	# { from = 37000; to = 44000; }
      ];
      allowedUDPPortRanges = [
      	{ from = 1714; to = 1764; }
      ];
    };
    nftables.enable = true;
  };
}

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
      trustedInterfaces = ["tailscale0"];
      allowedUDPPorts = [config.services.tailscale.port];
      allowedTCPPorts = [ 22 ];

      # port for kde
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

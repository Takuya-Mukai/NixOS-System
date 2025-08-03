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
    };
    nftables.enable = true;
  };
}

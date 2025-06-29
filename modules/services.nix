{
  services = {
    blueman.enable = true;
    services.polkit-gnome.enable = true;

  services.tailscale.enable = true;
  networking.firewall = {
    enable = true;
    trustedInterfaces = ["tailscale0"];
    allowedUDPPorts = [config.services.tailscale.port];
  };
}

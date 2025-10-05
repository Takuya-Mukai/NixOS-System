{
  config,
  pkgs,
  inputs,
  ...
}:
{
  virtualisation = {
    docker.enable = true;
    libvirtd = {
      enable = true;
      allowedBridges = [ "virbr0" ];
    };
  };
  programs.virt-manager.enable = true;

}

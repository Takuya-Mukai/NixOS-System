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
  boot.extraModprobeConfig = ''
    options kvm_amd nested=1
    options kvm ignore_msrs=1 report_ignored_msrs=0
  '';
}

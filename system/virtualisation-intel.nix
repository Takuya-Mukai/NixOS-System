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
    options kvm_intel nested=1
    options kvm_intel emulate_invalid_guest_state=0
    options kvm ignore_msrs=1 report_ignored_msrs=0
  '';
}

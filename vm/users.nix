{ config, pkgs, inputs, ... }:

{
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirt" ];
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.user = {
      home.stateVersion = "25.05";
    };
  };
}

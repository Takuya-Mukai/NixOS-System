{ config, pkgs, inputs, ... }:

{
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirt" ];
    shell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.user = {
      home.stateVersion = "25.05";
      imports = [
        ../users/linux/home.nix
      ];
    };
  };
}

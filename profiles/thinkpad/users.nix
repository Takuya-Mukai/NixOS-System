{ config, pkgs, inputs, ... }:

{
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirt" ];
    shell = pkgs.zsh;
  };

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.user = {
      home.stateVersion = "25.05";
      home.username = "user";
      home.homeDirectory = "/home/user";
      imports = [
        ../../modules/cli.nix
        # ../../modules/gui.nix
        ../../modules/localization/fcitx5.nix
        ../../modules/theme/default.nix
        ../../modules/wayland/core.nix
        ../../modules/wayland/wlogout/default.nix
        ../../modules/wayland/hypr/default.nix
      ];
    };
  };
}

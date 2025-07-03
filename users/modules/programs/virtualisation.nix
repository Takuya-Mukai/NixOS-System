{ config, pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true; # set $DOCKER_HOST
      };
    };
  };
}

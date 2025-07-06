{ config, pkgs, ... }
{
  programs.neovim = {
    enable = true; # nvimパッケージもインストールされる
    extraPackages = with pkgs; [
      # dependencies for neovim
      gnumake
      gcc
      nodePackages.nodejs

      # plugins
      with vimPlugins; [
        nvim-cmp
      ];
    ];
  };
  home.file.".config/nvim".source = ../config/nvim;
}

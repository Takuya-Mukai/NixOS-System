{ config, pkgs, ... }:

{
  # 両方のOSで使うパッケージ
  home.packages = with pkgs; [
    tree
    tesseract
    # tesseract.data.eng
    # tesseract.data.jpn
    # tesseract.data.jpn_vert
    # tesseract.data.ell
    # tesseract.data.tha
    typst
    gemini-cli
    neofetch
  ];

  programs = {
    bat.enable = true;
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    btop = {
      enable = true;
      settings = {
        theme = "kanagawa_wave";
        vim_keys = true;
        graph_symbol = "braille";
        graph_symbol_cpu = "braille";
        graph_symbol_gpu = "default";
        graph_symbol_mem = "default";
        rounded_corners = false;
      };
    };
    eza = {
      enable = true;
      enableZshIntegration = true;
      colors = "auto";
      git = true;
    };
    fd = {
      enable = true;
    };
    yazi = {
      enable = true;
      enableZshIntegration = true;
    };

  # Zshの設定 (両OS共通)
    zsh = {
      enable = true;
      shellAliases = { ll = "ls -l"; };
      # ...
    };
    neovim.enable = true; # nvimパッケージもインストールされる
  };

  home.file.".zshrc" = {
    source = ./modules/zsh/.zshrc;
    force = true;
  };
  home.file.".zshrc.zni" = {
    source = ./modules/zsh/.zshrc.zni;
    force = true;
  };
  home.file.".config/nvim" = {
    source = ./modules/config/nvim;
    force = true;
    recursive = true;
  };
}

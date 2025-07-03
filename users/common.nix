{ config, pkgs, inputs, ... }:

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
  # --- アプリケーションの設定ファイルを配置 ---
  # 例: Neovimの設定
  # xdg.configFile."nvim".source = ./../config/nvim; # config/nvim ディレクトリを ~/.config/nvim に配置

  # --- 自作スクリプトの配置 ---
  # 例: hello.sh を ~/.local/bin/hello として配置
  # home.file.".local/bin/hello" = {
  #   source = ./../scripts/hello.sh;
  #   executable = true; # 実行権限を付与
  # };
}

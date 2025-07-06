{ config, pkgs, lib, ... }:

let
  pluginNames = [
  # cmp
    "nvim-cmp" "cmp-nvim-lsp" "cmp-buffer" "cmp-path"
    "cmp-cmdline" "lspkind-nvim" "copilot-lua" "luasnip"
    "cmp_luasnip" "friendly-snippets" "copilot-cmp"
    "cmp-latex-symbols"
  ];


in {
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    plugins = map(name: pkgs.vimPlugins.${name}) pluginNames;

    extraPackages = with pkgs; [
      gnumake
      gcc
      ripgrep
      fd
    ];
  };
  home.xdg.configFile."nvim" = {
    source = ../config/nvim;
    recursive = true;
  }
}

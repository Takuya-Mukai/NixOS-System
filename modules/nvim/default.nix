{ config, pkgs, ... }:
{

  let
    toVarName = str: builtins.replaceStrings ["-"] ["_"] str;
  
    buildSubstArgs = pkgs: plugins: builtins.listToAttrs (builtins.map (p: {
      name = toVarName p;
      value = builtins.getAttr p pkgs.vimPlugins;
    }) plugins);
  
    pluginNames = [
    # cmp
    "nvim-cmp" "cmp-nvim-lsp" "cmp-buffer" "cmp-path" "cmp-cmdline" "lspkind-nvim" "copilot-lua" "luasnip" "cmp_luasnip" "friendly-snippets" "copilot-cmp" "lspkind-nvim" "cmp-latex-symbols"
    ];
  
  in

  {
  programs.neovim = {
    enable = true; # nvimパッケージもインストールされる
    extraPackages = with pkgs; [
      # dependencies for neovim
      gnumake
      gcc
      nodePackages.nodejs
    ] ++ (map (p: builtins.getAttr p pkgs.vimPlugins) pluginNames);
  };
  home.file.".config/nvim" = {
    source = pkgs.substituteAllFiles ({
      src = ../config/nvim;
    } // buildSubstArgs pkgs pluginNames);
    recursive = true;
  };
  }
}

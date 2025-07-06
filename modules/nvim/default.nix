{ config, pkgs, ... }:

let
  pluginNames = [
    "nvim-cmp" "cmp-nvim-lsp" "cmp-buffer" "cmp-path"
    "cmp-cmdline" "lspkind-nvim" "copilot-lua" "luasnip"
    "cmp_luasnip" "friendly-snippets" "copilot-cmp"
    "cmp-latex-symbols"
  ];

  toVarName = str: builtins.replaceStrings ["-"] ["_"] str;

  pluginVars = builtins.listToAttrs (builtins.map (p: {
    name = toVarName p;
    value = pkgs.vimPlugins.${p};
  }) pluginNames);

  luaFiles = builtins.filter (file: builtins.match ".*\\.lua$" file != null)
    (builtins.attrNames (builtins.readDir ./config/nvim/lua/plugins));

  replacedLuaFiles = builtins.listToAttrs (map (file: {
    name = "../config/nvim/lua/plugins/${file}";
    value = pkgs.substituteAll ({
      src = ../config/nvim/lua/plugins/${file};
      name = file;
    } // pluginVars);
  }) luaFiles);

in {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      gnumake
      gcc
      nodePackages.nodejs
    ] ++ (map (p: pkgs.vimPlugins.${p}) pluginNames);
  };

  home.file = replacedLuaFiles;
}


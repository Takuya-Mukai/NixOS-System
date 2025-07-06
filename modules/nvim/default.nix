{ config, pkgs, lib, ... }:

let
  pluginNames = [
    "nvim-cmp" "cmp-nvim-lsp" "cmp-buffer" "cmp-path"
    "cmp-cmdline" "lspkind-nvim" "copilot-lua" "luasnip"
    "cmp_luasnip" "friendly-snippets" "copilot-cmp"
    "cmp-latex-symbols"
  ];

  toVarName = str: builtins.replaceStrings ["-"] ["_"] str;

  pluginVars = builtins.listToAttrs (map (p: {
    name = toVarName p;
    value = "${pkgs.vimPlugins.${p}}";
  }) pluginNames);

  luaFilesDir = ../config/nvim/lua/plugins;

  luaFiles = builtins.filter (f: lib.hasSuffix ".lua" f)
    (builtins.attrNames (builtins.readDir luaFilesDir));

  replacedLuaFiles = builtins.listToAttrs (map (file: {
    name = ".config/nvim/lua/plugins/${file}";
    value = pkgs.replaceVars {
      src = "${luaFilesDir}/${file}";
      replacements = pluginVars;
    };
  }) luaFiles);

in {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      gnumake
      gcc
      nodejs
    ] ++ (map (p: pkgs.vimPlugins.${p}) pluginNames);
  };

  home.file = replacedLuaFiles;
}

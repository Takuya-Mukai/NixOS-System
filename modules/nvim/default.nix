{ config, pkgs, lib, ... }:

let
  pluginPath = "${pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start";
in {
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;

    # デバッグのため、letやmapを使わず、プラグインを直接リストアップします
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
      # cmp.lua
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      lspkind-nvim
      copilot-lua
      luasnip
      cmp_luasnip
      friendly-snippets
      copilot-cmp
      cmp-latex-symbols

      # color.lua
      kanagawa-nvim
      rainbow-delimiters-nvim
      nvim-treesitter
      nvim-treesitter-textobjects
      
      # lsp.lua
      trouble-nvim
      nvim-lspconfig
      none-ls-nvim

      # tools.lua
      which-key-nvim
      telescope-nvim
      smart-open-nvim
      sqlite-lua
      nvim-tree-lua
      yazi-nvim
      mini-nvim
      toggleterm-nvim
      CopilotChat-nvim
      nvim-parinfer
      diffview-nvim
      hardtime-nvim

      # ui.lua
      nvim-hlslens
      nvim-scrollbar
      gitsigns-nvim
      hlchunk-nvim
      lualine-nvim
      nvim-navic
      nvim-navbuddy
      fidget-nvim
      nvim-notify

      # dap.lua
      nvim-dap
      nvim-dap-ui
      nvim-nio
      nvim-dap-python
      lazydev-nvim
      vim-startuptime
      vim-startuptime
      typst-preview-nvim
      
      # treesitter
      nvim-treesitter.withAllGrammars
      
    ];

    extraPackages = with pkgs; [
      gnumake
      gcc
      ripgrep
      fd
      # lsp
      lua-language-server
      luajitPackages.luacheck
      luaformatter
      
      black
      pyright

      clangd
      codelldb
      cpplint
      clang-format

      bash-language-server
      shellcheck
      beautysh

      nil
      nixpkgs-fmt
    ];
    extraLuaConfig = ''
      vim.loader.enable()
      --  vim.g.nix_plugins_path = "${pkgs.vimUtils.packDir programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start"
      vim.g.nix_plugins_path = "${pluginPath}"
      require('config.config')
      require('config.lazy')
      require('config.scripts')
    '';
  };
  xdg.configFile."nvim/lua" = {
    source = ../config/nvim/lua;
    recursive = true;
  };
}

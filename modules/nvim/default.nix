{ config, pkgs, lib, ... }:
{
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
      kangawa-nvim
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
      nvim-treesitter-parsers.vimdoc
      nvim-treesitter-parsers.typst
      nvim-treesitter-parsers.rust
      nvim-treesitter-parsers.python
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.markdown-inline
      nvim-treesitter-parsers.markdown
      nvim-treesitter-parsers.lua
      nvim-treesitter-parsers.latex
      nvim-treesitter-parsers.hyprlang
      nvim-treesitter-parsers.gitignore
      nvim-treesitter-parsers.gitcommit
      nvim-treesitter-parsers.gitattributes
      nvim-treesitter-parsers.git_rebase
      nvim-treesitter-parsers.git_config
      nvim-treesitter-parsers.dockerfile
      nvim-treesitter-parsers.diff
      nvim-treesitter-parsers.desktop
      nvim-treesitter-parsers.cpp
      nvim-treesitter-parsers.c
      nvim-treesitter-parsers.bibtex
      nvim-treesitter-parsers.bash
      
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

    extraPackages = with pkgs; [
      gnumake
      gcc
      ripgrep
      fd
    ];
  };
}

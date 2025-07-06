return{
  {
    -- "hrsh7th/nvim-cmp",
    name = "nvim-cmp",
    dir = "@nvim_cmp@",
    event = { "InsertEnter", "CmdlineEnter" },
    config = function() require 'plugins-config.cmp.nvim-cmp' end,
    dependencies = {
      -- "hrsh7th/cmp-nvim-lsp",
      name = "cmp-nvim-lsp",
      dir = "@cmp_nvim_lsp@",
      event = { "InsertEnter", "CmdlineEnter"},
      dependencies = {
        {
          -- 'L3MON4D3/LuaSnip',
          name = "LuaSnip",
          dir = "@luasnip@",
          -- build = 'make install_jsregexp',
          config = function() require 'plugins-config.cmp.luasnip' end,
          dependencies = {
            {
              -- 'saadparwaiz1/cmp_luasnip'
              name = "cmp_luasnip",
              dir = "@cmp_luasnip@"
            },
            {
              -- 'rafamadriz/friendly-snippets'
              name = "friendly-snippets",
              dir = "@friendly_snippets@",
            },
          },
          event = "InsertEnter",
        },
        {
          -- 'zbirenbaum/copilot-cmp',
          name = "copilot-cmp",
          dir = "@copilot_cmp@",
          dependencies =
          {
            -- 'copilot.lua',
            name = "copilot.lua",
            dir = "@copilot_lua@",
          },
          config = function() require('copilot_cmp').setup() end,
          cmd = "CS",
          event = "InsertEnter",
        },
        {
          -- 'hrsh7th/cmp-buffer',
          name = "cmp-buffer",
          dir = "@cmp_buffer@",
        },
        {
          -- 'hrsh7th/cmp-path',
          name = "cmp-path",
          dir = "@cmp_path@",
        },
        {
          -- 'hrsh7th/cmp-cmdline',
          name = "cmp-cmdline",
          dir = "@cmp_cmdline@",
        },
        {
          -- 'onsails/lspkind.nvim',
          name = "lspkind.nvim",
          dir = "@lspkind_nvim@",
        },
        {
          -- "kdheepak/cmp-latex-symbols",
          name = "cmp-latex-symbols",
          dir = "@cmp_latex_symbols",
        },
      },
    }
  },
  {
    -- "zbirenbaum/copilot.lua",
    name = "copilot.lua",
    dir = "copilot_lua",
    event = "InsertEnter",
    config = function()
      require("plugins-config.cmp.copilot")
    end,
  },
}

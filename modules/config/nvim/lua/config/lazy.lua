require("lazy").setup({
  dev = {
    path = vim.g.nix_plugins_path,
    patterns = {""},
  },
  spec = {
    { import = "plugins" },
  },
  checker = {
    enabled = false,
  },
  install = {
    missing = false,
  },
  ui = {
    border="single",
  },
  performance = {
    rtp = {
      reset = false,
    },
  },
})

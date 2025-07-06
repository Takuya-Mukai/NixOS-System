require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker.enabled = false,
  install.missing = false,
  ui.border="single",
})

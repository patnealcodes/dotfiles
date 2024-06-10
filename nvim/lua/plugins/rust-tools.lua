return {
  "simrat39/rust-tools.nvim",
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    dependencies = { "plenary" },
    config = function()
      require("crates").setup {
        popup = {
          border = "rounded",
        },
      }
    end,
  },
}

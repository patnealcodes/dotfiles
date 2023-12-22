return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato",
      transparent_background = true,
    })
    vim.cmd.colorscheme "catppuccin"
  end
}

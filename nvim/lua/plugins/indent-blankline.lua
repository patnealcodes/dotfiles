return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require("ibl").setup({
      debounce = 100,
      indent = {
        char = "▏"
      },
      whitespace = { highlight = { "Whitespace", "NonText" } },
      scope = {
        show_exact_scope = true,
        show_start = false,
        show_end = false,
      }
    })
  end
}

return {
  'nvim-lualine/lualine.nvim',
  requires = { 'devicons', opt = true },
  config = function()
    require("lualine").setup({
      options = {
        theme = "ayu_mirage",
      },
      sections = {
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
        lualine_x = {
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end
}

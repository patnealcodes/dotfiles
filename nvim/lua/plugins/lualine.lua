return {
  'nvim-lualine/lualine.nvim',
  requires = { 'devicons', opt = true },
  config = function()
    require("lualine").setup({
      options = {
        theme = "nightfly",
        section_separators = { left = "", right = "" },
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

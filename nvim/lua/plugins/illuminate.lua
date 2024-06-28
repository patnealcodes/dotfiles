return {
  "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure({
      active = true,
      on_config_done = nil,
      options = {
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        delay = 200,
        filetype_overrides = {},
        filetypes_denylist = {
          "dirvish",
          "fugitive",
          "alpha",
          "NvimTree",
          "lazy",
          "neogitstatus",
          "Trouble",
          "lir",
          "Outline",
          "spectre_panel",
          "toggleterm",
          "DressingSelect",
          "TelescopePrompt",
        },
        filetypes_allowlist = {},
        modes_denylist = {},
        modes_allowlist = {},
        providers_regex_syntax_denylist = {},
        providers_regex_syntax_allowlist = {},
        under_cursor = true,
      }
    })
  end,
}

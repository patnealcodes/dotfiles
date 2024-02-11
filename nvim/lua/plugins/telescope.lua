return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "plenary",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          path_display = { "truncate" },
          initial_mode = "normal",
        },
        pickers = {
          opts = {
            cwd_to_path = true,
          },
          live_grep = {
            initial_mode = "insert",
          },
          find_files = {
            hidden = true,
            initial_mode = "insert",
          },
          file_browser = {
            hidden = true,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
        file_browser = {
          hijack_netrw = true,
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("harpoon")
      telescope.load_extension("file_browser")
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
}

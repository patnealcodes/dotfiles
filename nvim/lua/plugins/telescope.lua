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
          path_display = { "smart" },
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 120,
            horizontal = {
              preview_width = 0.55,
            },
            vertical = {
              preview_height = 0.5,
            },
          },
        },
        hover = {
          border = "single",
          padding = 10,
          winblend = 25,
        },
        pickers = {
          opts = {
            cwd_to_path = true,
          },
          live_grep = {
            initial_mode = "insert",
          },
          find_files = {
            hidden = false,
            initial_mode = "insert",
          },
          file_browser = {
            hidden = false,
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


      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
      vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
      vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
      vim.keymap.set(
        "n",
        "<leader>shf",
        "<CMD>Telescope find_files hidden=true<CR>",
        { desc = "[S]earch (Including [H]idden) [F]iles" }
      )
      vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
      vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
      vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
      vim.keymap.set(
        "n",
        "<leader>shg",
        "<CMD>Telescope live_grep hidden=true<CR>",
        { desc = "[S]earch by (Including [H]idden) [G]rep" }
      )
      vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
      vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
      vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set(
        "n",
        "<leader>sh.",
        "<CMD>Telescope oldfiles hidden=true<CR>",
        { desc = '[S]earch Recent Files (Including [H]idden) ("." for repeat)' }
      )
      vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
      vim.keymap.set(
        "n",
        "-",
        "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>",
        { desc = "[F]ile [B]rowser" }
      )
      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set("n", "<leader>/", function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = "[/] Fuzzily search in current buffer" })

      -- Also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set("n", "<leader>s/", function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        })
      end, { desc = "[S]earch [/] in Open Files" })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set("n", "<leader>sn", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "[S]earch [N]eovim files" })
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
}

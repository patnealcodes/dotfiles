-- Harpoon configuration with fzf-lua integration
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ibhagwan/fzf-lua",
  },
  config = function()
    local harpoon = require "harpoon"
    harpoon:setup {}

    -- FZF-Lua integration for harpoon
    local function toggle_fzf_lua(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("fzf-lua").fzf_exec(file_paths, {
        prompt = "Harpoon❯ ",
        preview_window = "right:50%",
        actions = {
          ["default"] = function(selected)
            if selected and selected[1] then
              vim.cmd("edit " .. selected[1])
            end
          end,
        },
      })
    end

    -- Keymaps
    vim.keymap.set("n", "<leader>H", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Open harpoon window" })

    vim.keymap.set("n", "<leader>ht", function()
      toggle_fzf_lua(harpoon:list())
    end, { desc = "Open harpoon list in fzf-lua" })

    vim.keymap.set("n", "<leader>ha", function()
      require("harpoon"):list():add()
    end, { desc = "Add buffer to harpoon list" })

    -- Number keymaps
    for i = 1, 5 do
      vim.keymap.set("n", "<leader>" .. i, function()
        require("harpoon"):list():select(i)
      end, { desc = "Jump to harpoon buffer " .. i })
    end
  end,
}

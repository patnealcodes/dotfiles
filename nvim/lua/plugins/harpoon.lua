return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = {
    "plenary",
  },
  config = function()
    local keymap = vim.keymap
    local harpoon = require("harpoon")

    harpoon:setup()

    keymap.set("n", "<leader>a", function() harpoon:list():add() end, {})
    keymap.set("n", "<M-S-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {})
    keymap.set("n", "<M-S-j>", function() harpoon:list():select(1) end, {})
    keymap.set("n", "<M-S-k>", function() harpoon:list():select(2) end, {})
    keymap.set("n", "<M-S-l>", function() harpoon:list():select(3) end, {})
    keymap.set("n", "<M-S-;>", function() harpoon:list():select(4) end, {})
  end,
}

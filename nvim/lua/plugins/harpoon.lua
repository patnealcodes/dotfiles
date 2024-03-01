return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = {
    "plenary",
  },
  config = function()
    local keymap = vim.keymap

    keymap.set("n", "<leader>a", function()
      require("harpoon"):list():append()
    end, {})
    keymap.set("n", "<leader>h", function()
      require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
    end, {})
    keymap.set("n", "<leader>1", function()
      require("harpoon"):list():select(1)
    end, {})
    keymap.set("n", "<leader>2", function()
      require("harpoon"):list():select(2)
    end, {})
    keymap.set("n", "<leader>3", function()
      require("harpoon"):list():select(3)
    end, {})
    keymap.set("n", "<leader>4", function()
      require("harpoon"):list():select(4)
    end, {})
  end,
}

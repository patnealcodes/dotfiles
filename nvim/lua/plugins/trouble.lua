return {
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup()

      vim.keymap.set("n", "<leader>tt", "<CMD>Trouble diagnostics toggle focus=true<CR>",
        { desc = "Toggle trouble diagnostics " })

      vim.keymap.set("n", "<leader>tb", "<CMD>Trouble diagnostics toggle focus=true filter.buf=0<CR>",
        { desc = "Toggle trouble diagnostics in the current buffer" })

      vim.keymap.set("n", "[t", function()
        require("trouble").next({ skip_groups = true, jump = true });
      end)

      vim.keymap.set("n", "]t", function()
        require("trouble").previous({ skip_groups = true, jump = true });
      end)
    end
  },
}

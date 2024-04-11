return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({
      icons = false,
      -- height = 20,
      -- mode = "document_diagnostics",
    })

    vim.keymap.set("n", "<leader>tt", function()
      require("trouble").toggle()
    end)

    vim.keymap.set("n", "<leader>tn", function()
      require("trouble").next({ skip_groups = true, jump = true })
    end)

    vim.keymap.set("n", "<leader>tp", function()
      require("trouble").previous({ skip_groups = true, jump = true })
    end)
  end,
}


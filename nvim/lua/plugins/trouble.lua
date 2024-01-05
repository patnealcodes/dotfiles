return {
  "folke/trouble.nvim",
  config = function()
    local trouble = require("trouble")
    trouble.setup({
      icons = false
    })

    vim.keymap.set('n', '<leader>tt', function ()
      trouble.toggle()
    end)
    vim.keymap.set('n', '<leader>tn', function ()
      trouble.next()
    end)
    vim.keymap.set('n', '<leader>tp', function ()
      trouble.prev()
    end)
  end
}

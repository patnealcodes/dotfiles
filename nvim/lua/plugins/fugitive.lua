return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)


    local autocmd = vim.api.nvim_create_autocmd
    autocmd("BufWinEnter", {
      group = vim.api.nvim_create_augroup("fugitive", {}),
      pattern = "*",
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>", opts);
      end,
    })


    vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
    vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
  end
}

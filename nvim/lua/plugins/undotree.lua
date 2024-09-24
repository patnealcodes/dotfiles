return {
  "mbbill/undotree",
  config = function()
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_WindowLayout = 2

    vim.keymap.set("n", "<leader>u", "<cmd>UndoTreeToggle<cr>", { desc = "Toggle UndoTree" })
  end
}

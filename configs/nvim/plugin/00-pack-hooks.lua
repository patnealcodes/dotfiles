local pack_helpers = require("pack_helpers")

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind

    if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
      return
    end

    if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
      if vim.fn.executable("make") ~= 1 then
        vim.notify("telescope-fzf-native: 'make' not found, skipping build", vim.log.levels.WARN)
        return
      end
      pack_helpers.run_in_plugin_dir("telescope-fzf-native.nvim", { "make" })
    end
  end,
})

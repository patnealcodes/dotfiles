require "opts"
require "keymaps"
require "lazy_init"

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local MyGroup = augroup("Auu Yeah", {})

autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})

autocmd("TextYankPost", {
  group = augroup("HighlightYank", {}),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 40,
    }
  end,
})

autocmd("LspAttach", {
  group = MyGroup,
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "<leader>ca", function()
      vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "gi", function()
      vim.lsp.buf.implementation()
    end, opts)
    vim.keymap.set("n", "<leader>rn", function()
      vim.lsp.buf.rename()
    end, opts)
  end,
})
autocmd("BufWritePre", {
  callback = function(args)
    require("conform").format {
      bufnr = args.buf,
      lsp_fallback = true,
      quiet = true,
    }
  end,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  focusable = false,
  style = "minimal",
  border = "rounded",
  source = "always",
  header = "",
  prefix = "",
})

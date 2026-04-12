local treesitter = require("nvim-treesitter")

treesitter.setup({})

local function ensure_parser(lang)
  if not vim.list_contains(treesitter.get_installed("parsers"), lang) then
    treesitter.install(lang)
  end
end

-- Parsers required for LSP hover/docs rendering
ensure_parser("markdown")
ensure_parser("markdown_inline")
ensure_parser("typescript")
ensure_parser("vue")

vim.treesitter.language.register("tsx", "typescriptreact")
vim.treesitter.language.register("tsx", "javascriptreact")

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    if args.match == "typescriptreact" or args.match == "javascriptreact" then
      ensure_parser("tsx")
      pcall(vim.treesitter.start, args.buf, "tsx")
      return
    end

    pcall(vim.treesitter.start, args.buf)
  end,
})

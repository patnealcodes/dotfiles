local key = vim.keymap.set

-- Take Me To Your Leader
vim.g.mapleader = " "

-- General
key("n", "<Esc>", "<cmd>nohl<cr>", { desc = "No highlight" })
key("n", ";", "/<BS>", { desc = "Clear command line" })
key("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move visually selected line down" })
key("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move visually selected line up" })
key("n", "J", "mzJ`z", { desc = "Join line with line below but retain cursor position" })
key("n", "<C-d>", "<C-d>zz", { desc = "<C-d>, but also reposition window center at cursor" })
key("n", "<C-u>", "<C-u>zz", { desc = "<C-u>, but also reposition window center at cursor" })
key("n", "n", "nzzzv", { desc = "Go to next selection, reposition window at cursor, open folds around selection" })
key("n", "N", "Nzzzv", { desc = "Go to prev selection, reposition window at cursor, open folds around selection" })
key({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to blank register" })
key("x", "<leader>p", [["_dP]], { desc = "Delete to blank register & paste" })
key("n", "<leader>rp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- LSP
key("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Go to definition" })
key("n", "K", function() vim.lsp.buf.hover() end, { desc = "Hover info" })
key("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, { desc = "Workspace Symbols" })
key("n", "<leader>vd", function() vim.diagnostic.open_float() end, { desc = "Open floating diagnostics" })
key("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "Code actions" })
key("n", "<leader>rn", function() vim.lsp.buf.rename() end, { desc = "Rename" })
key("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { desc = "Signature help" })
key("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Go to previous dignostic issue" })
key("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Go to next dignostic issue" })
key("n", "<leader>f", vim.lsp.buf.format, { desc = "Format via LSP" })

-- Persistence
vim.keymap.set("n", "<leader>=-", [[:lua require("persistence").load() <cr>]], { desc = "Load last session" })

vim.g.mapleader = " "
local keymap = vim.keymap

--// UNMAP \\--
keymap.set({ "c", "n", "i" }, "<S-Up>", "")
keymap.set({ "c", "n", "i" }, "<S-Down>", "")

--// BASE \\--
keymap.set({ "c", "n", "i" }, "<C-c>", "<Esc>")
keymap.set({ "c", "n", "i" }, "<Down>", "<C-n>")
keymap.set({ "c", "n", "i" }, "<Up>", "<C-p>")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("x", "<leader>s", [[:%s/\<>/<>/gI<Left><Left><Left>]])

keymap.set("x", "p", [["_dP]])
keymap.set({ "n", "v" }, "y", [["+y]])
keymap.set("n", "Y", [["+Y]])
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "<C-w>", "<cmd>bd<CR>")
keymap.set("n", "<C-w>!", "<cmd>bd!<CR>")

--// PLUGINS \\--

-- Neogen
keymap.set('n', "<leader>nf", function ()
  require("neogen").generate({ type = "func" })
end)
keymap.set({ 'i', 's' }, "<C-y>", function ()
  return require("luasnip").luasnip.jump(-1)
end, { silent = true })
keymap.set({ 'i', 's' }, "<C-u>", function ()
  return require("luasnip").luasnip.jump(1)
end, { silent = true })

-- Harpoon
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


-- Trouble
keymap.set('n', '<leader>tt', function ()
  require("trouble").toggle()
end)
keymap.set('n', '<leader>tn', function ()
  require("trouble").next()
end)
keymap.set('n', '<leader>tp', function ()
  require("trouble").prev()
end)

-- Telescope

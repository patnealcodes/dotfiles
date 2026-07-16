local plugin_dir = require("pack_helpers").plugin_dir("vim-herdr-navigation")

dofile(vim.fs.joinpath(plugin_dir, "editor", "nvim.lua"))

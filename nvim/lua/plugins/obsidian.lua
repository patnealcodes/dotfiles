return {
  "epwalsh/obsidian.nvim",
  version = "*",
  cmd = "ObsidianQuickSwitch",
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre vim.fn.expand ~/Documents/BisVault/**.md",
    "BufNewFile vim.fn.expand ~/Documents/BisVault/**.md",
  },
  opts = {
    workspaces = {
      {
        name = "BisVault",
        path = "~/Documents/BisVault",
      },
    },
  },
}

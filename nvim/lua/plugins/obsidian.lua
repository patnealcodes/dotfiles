return {
  "epwalsh/obsidian.nvim",
  version = "*",
  cmd = "ObsidianQuickSwitch",
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre ~/Documents/Vaults/**.md",
    "BufNewFile ~/Documents/Vaults/**.md",
  },
  opts = {
    workspaces = {
      {
        name = "Engineering Vault",
        path = "~/Documents/Vaults",
      },
    },
  },
}

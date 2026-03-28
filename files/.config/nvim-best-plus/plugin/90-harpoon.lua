local harpoon_instance

local function get_harpoon()
  if harpoon_instance then
    return harpoon_instance
  end

  vim.cmd.packadd("harpoon")
  harpoon_instance = require("harpoon")
  harpoon_instance:setup({})
  return harpoon_instance
end

local function open_picker(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  vim.ui.select(file_paths, {
    prompt = "Harpoon",
  }, function(choice)
    if choice then
      vim.cmd("edit " .. choice)
    end
  end)
end

vim.keymap.set("n", "<leader>H", function()
  local harpoon = get_harpoon()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Open harpoon window" })

vim.keymap.set("n", "<leader>ht", function()
  local harpoon = get_harpoon()
  open_picker(harpoon:list())
end, { desc = "Open harpoon list" })

vim.keymap.set("n", "<leader>ha", function()
  local harpoon = get_harpoon()
  harpoon:list():add()
end, { desc = "Add buffer to harpoon list" })

for i = 1, 5 do
  vim.keymap.set("n", "<leader>" .. i, function()
    local harpoon = get_harpoon()
    harpoon:list():select(i)
  end, { desc = "Jump to harpoon buffer " .. i })
end

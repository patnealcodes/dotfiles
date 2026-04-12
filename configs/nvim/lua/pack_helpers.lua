local M = {}

function M.plugin_dir(name)
  return vim.fs.joinpath(vim.fn.stdpath("data"), "site", "pack", "core", "opt", name)
end

function M.run_in_plugin_dir(name, cmd)
  local result = vim.system(cmd, {
    cwd = M.plugin_dir(name),
    text = true,
  }):wait()

  if result.code == 0 then
    return true
  end

  local output = result.stderr ~= "" and result.stderr or result.stdout
  vim.notify(table.concat(cmd, " ") .. " failed for " .. name .. "\n" .. output, vim.log.levels.WARN)
  return false
end

return M

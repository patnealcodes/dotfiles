rex.bind("cmd+ctrl+h", "pane.focus.left")
rex.bind("cmd+ctrl+j", "pane.focus.down")
rex.bind("cmd+ctrl+k", "pane.focus.up")
rex.bind("cmd+ctrl+l", "pane.focus.right")

local function project_session_command(folder)
  local script = os.getenv("HOME") .. "/.config/rex/rex-sessionizer"
  local command = { script }

  if folder ~= nil and folder ~= "" then
    table.insert(command, folder)
  end

  return command
end

rex.action {
  name = "project_session",
  title = "Open Project Session…",
  description = "Choose a project folder and open or switch to its Rex session.",
  category = "Session",
  keywords = "project folder directory session fzf",
  args = { folder = "string?" },
  run = function(ctx, args)
    local result, err = rex.session.new_window {
      layout = rex.layout.block {
        flavor = "com.superlogical.terminal.shell",
        options = {
          command = project_session_command(args.folder),
        },
      },
      window_label = "Projects",
    }

    if result == nil then error(err, 0) end
    return result
  end,
}

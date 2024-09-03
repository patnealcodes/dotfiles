local icons = {
  kind = {
    Array = "",
    Boolean = "",
    Class = "",
    Color = "",
    Constant = "",
    Constructor = "",
    Enum = "",
    EnumMember = "",
    Event = "",
    Field = "",
    File = "",
    Folder = "󰉋",
    Function = "",
    Interface = "",
    Key = "",
    Keyword = "",
    Method = "",
    Module = "",
    Namespace = "",
    Null = "󰟢",
    Number = "",
    Object = "",
    Operator = "",
    Package = "",
    Property = "",
    Reference = "",
    Snippet = "",
    String = "",
    Struct = "",
    Text = "",
    TypeParameter = "",
    Unit = "",
    Value = "",
    Variable = "",
  },
  git = {
    LineAdded = "",
    LineModified = "",
    LineRemoved = "",
    FileDeleted = "",
    FileIgnored = "◌",
    FileRenamed = "",
    FileStaged = "S",
    FileUnmerged = "",
    FileUnstaged = "",
    FileUntracked = "U",
    Diff = "",
    Repo = "",
    Octoface = "",
    Branch = "",
  },
  ui = {
    ArrowCircleDown = "",
    ArrowCircleLeft = "",
    ArrowCircleRight = "",
    ArrowCircleUp = "",
    BoldArrowDown = "",
    BoldArrowLeft = "",
    BoldArrowRight = "",
    BoldArrowUp = "",
    BoldClose = "",
    BoldDividerLeft = "",
    BoldDividerRight = "",
    BoldLineLeft = "▎",
    BookMark = "",
    BoxChecked = "",
    Bug = "",
    Stacks = "",
    Scopes = "",
    Watches = "󰂥",
    DebugConsole = "",
    Calendar = "",
    Check = "",
    ChevronRight = "",
    ChevronShortDown = "",
    ChevronShortLeft = "",
    ChevronShortRight = "",
    ChevronShortUp = "",
    Circle = " ",
    Close = "󰅖",
    CloudDownload = "",
    Code = "",
    Comment = "",
    Dashboard = "",
    DividerLeft = "",
    DividerRight = "",
    DoubleChevronRight = "»",
    Ellipsis = "",
    EmptyFolder = "",
    EmptyFolderOpen = "",
    File = "",
    FileSymlink = "",
    Files = "",
    FindFile = "󰈞",
    FindText = "󰊄",
    Fire = "",
    Folder = "󰉋",
    FolderOpen = "",
    FolderSymlink = "",
    Forward = "",
    Gear = "",
    History = "",
    Lightbulb = "",
    LineLeft = "▏",
    LineMiddle = "│",
    List = "",
    Lock = "",
    NewFile = "",
    Note = "",
    Package = "",
    Pencil = "󰏫",
    Plus = "",
    Project = "",
    Search = "",
    SignIn = "",
    SignOut = "",
    Tab = "󰌒",
    Table = "",
    Target = "󰀘",
    Telescope = "",
    Text = "",
    Tree = "",
    Triangle = "󰐊",
    TriangleShortArrowDown = "",
    TriangleShortArrowLeft = "",
    TriangleShortArrowRight = "",
    TriangleShortArrowUp = "",
  },
  diagnostics = {
    BoldError = "",
    Error = "",
    BoldWarning = "",
    Warning = "",
    BoldInformation = "",
    Information = "",
    BoldQuestion = "",
    Question = "",
    BoldHint = "",
    Hint = "󰌶",
    Debug = "",
    Trace = "✎",
  },
  misc = {
    Robot = "󰚩",
    Squirrel = "",
    Tag = "",
    Watch = "",
    Smiley = "",
    Package = "",
    CircuitBoard = "",
  },
}

-- local conditions = {
--   hide_in_width = function()
--     return vim.o.columns > 200
--   end,
-- }

local components = {
  mode = {
    "mode",
    fmt = function(str)
      local formatted = ""
      for word in formatted.gmatch(str, '([^-]+)') do
        formatted = formatted .. (formatted ~= "" and "-" or "") .. word:sub(1, 1)
      end
      return formatted
    end
  },

  filename = {
    "filename",
    path = 0,
    use_mode_colors = false,
    color = { fg = "none", bg = "none" },
    padding = {
      left = 1,
      right = 2
    }
  },

  filename_with_path = {
    "filename",
    path = 1,
    use_mode_colors = false,
    color = { fg = "#7b8496" },
    fmt = function(str)
      local prev = ""
      local path = ""
      for part in path.gmatch(str, '([^/]+)') do
        path = path .. (path ~= "" and "/" or "") .. prev
        prev = part
      end
      return path
    end
  },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = {
      error = icons.diagnostics.BoldError .. " ",
      warn = icons.diagnostics.BoldWarning .. " ",
      info = icons.diagnostics.BoldInformation .. " ",
      hint = icons.diagnostics.BoldHint .. " ",
    },
  },
  lsp = {
    function()
      local buf_clients = vim.lsp.get_clients { bufnr = 0 }
      if #buf_clients == 0 then
        return "LSP Inactive"
      end

      local buf_client_names = {}
      local copilot_active = false

      for _, client in pairs(buf_clients) do
        if client.name ~= "GitHub Copilot" then
          table.insert(buf_client_names, client.name)
        end

        if client.name == "GitHub Copilot" then
          copilot_active = true
        end
      end

      local unique_client_names = table.concat(buf_client_names, ", ")
      local language_servers = string.format("[%s]", unique_client_names)

      if copilot_active then
        language_servers = icons.git.Octoface .. " " .. language_servers
      end

      return language_servers
    end,
  },
}

return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup {
      options = {
        component_separators = { left = " ", right = " " },
        section_separators = { left = " ", right = " " },
      },
      sections = {
        lualine_a = { components.mode, },
        lualine_b = { components.filename, },
        lualine_c = { components.filename_with_path, },
        lualine_x = {
          components.diagnostics,
          components.lsp,
        },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { 'nvim-tree' }
    }
  end,
  event = "VimEnter",
}

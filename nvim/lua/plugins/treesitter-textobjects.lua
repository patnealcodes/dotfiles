return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = true,
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["a="] = { query = "@assignment.outer"},
            ["i="] = { query = "@assignment.inner"},
            ["l="] = { query = "@assignment.lhs"},
            ["r="] = { query = "@assignment.rhs"},

            -- works for javascript/typescript files (custom capture I created in after/queries/ecma/textobjects.scm)
            -- ^^^ thanks to @joseanmartinez
            ["a:"] = { query = "@property.outer"},
            ["i:"] = { query = "@property.inner"},
            ["l:"] = { query = "@property.lhs"},
            ["r:"] = { query = "@property.rhs"},

            ["aa"] = { query = "@parameter.outer"},
            ["ia"] = { query = "@parameter.inner"},

            ["ai"] = { query = "@conditional.outer"},
            ["ii"] = { query = "@conditional.inner"},

            ["al"] = { query = "@loop.outer"},
            ["il"] = { query = "@loop.inner"},

            ["af"] = { query = "@call.outer"},
            ["if"] = { query = "@call.inner"},

            ["am"] = { query = "@function.outer"},
            ["im"] = { query = "@function.inner"},

            ["ac"] = { query = "@class.outer"},
            ["ic"] = { query = "@class.inner"},
          }
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]f"] = { query = "@call.outer", desc = "Next function call start" },
            ["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
            ["]c"] = { query = "@class.outer", desc = "Next class start" },
            ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
            ["]l"] = { query = "@loop.outer", desc = "Next loop start" },

            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
            ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
            ["[c"] = { query = "@class.outer", desc = "Prev class start" },
            ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
            ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
          },
        },
      }
    })
  end
}

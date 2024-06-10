local snippet_collection = require "luasnip.session.snippet_collection"

local flavors = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
}

local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

for _, flavor in ipairs(flavors) do
  snippet_collection.clear_snippets(flavor)
  ls.add_snippets(flavor, {
    s("cl", fmt("console.log('{}', {})", { i(1), i(0) })),
  })
end

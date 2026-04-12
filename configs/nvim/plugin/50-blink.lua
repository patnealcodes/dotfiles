require("blink.cmp").setup({
  keymap = {
    preset = "none",
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide" },
    ["<Tab>"] = { "accept", "fallback" },
    ["<C-y>"] = { "accept", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-k>"] = { "scroll_documentation_up", "fallback" },
    ["<C-j>"] = { "scroll_documentation_down", "fallback" },
    ["<C-l>"] = { "snippet_forward", "fallback" },
    ["<C-h>"] = { "snippet_backward", "fallback" },
  },
  appearance = { nerd_font_variant = "mono" },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
    menu = {
      draw = {
        columns = { { "label", "label_description", gap = 1 } },
      },
    },
  },
  sources = {
    default = function()
      local sources = { "lsp", "path", "snippets", "buffer" }
      if package.loaded["lazydev"] then
        table.insert(sources, "lazydev")
      end
      return sources
    end,
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  },
  signature = { enabled = true },
  fuzzy = { implementation = "prefer_rust" },
})

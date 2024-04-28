return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "plenary",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "marilari88/neotest-vitest",
        "nvim-neotest/neotest-plenary",
    },
    config = function()
        -- TODO: Set this up
        local neotest = require("neotest")
        neotest.setup({
            adapters = {
                require("neotest-vitest"),
                require("neotest-plenary").setup(),
            }
        })

        vim.keymap.set("n", "<leader>tc", function()
            neotest.run.run()
        end)
    end,
}

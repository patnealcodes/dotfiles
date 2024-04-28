return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        'nvim-treesitter/nvim-treesitter-context',
    },
    opts = {
        ensure_installed = {
            'css',
            'html',
            'go',
            'javascript',
            'jsdoc',
            'lua',
            'markdown',
            'markdown_inline',
            'python',
            'scss',
            'rust',
            'typescript',
            'tsx',
            'vim',
            'vimdoc',
        },
        sync_install = false,
        auto_install = true,
        indent = {
            enable = true
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "markdown" },
        },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)

        require('treesitter-context').setup {
            enable = true,
            max_lines = 0,
            min_window_height = 0,
            line_numbers = true,
            multiline_threshold = 20,
            trim_scope = 'outer',
            mode = 'cursor',
            separator = nil,
            zindex = 20,
            on_attach = nil,
        }


        local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        treesitter_parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = { "src/parser.c", "src/scanner.c" },
                branch = "master",
            },
        }
    end
}

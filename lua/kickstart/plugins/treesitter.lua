return {
    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        event = 'bufRead',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs', -- Sets main module to use for opts
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
        opts = {
            ensure_installed = { 'bash', 'c', 'cpp', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = {
                enable = true,
                -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
                --  If you are experiencing weird indenting issues, add the language to
                --  the list of additional_vim_regex_highlighting and disabled languages for indent.
                additional_vim_regex_highlighting = { 'ruby' },
            },
            indent = { enable = true, disable = { 'ruby' } },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<c-space>',
                    node_incremental = '<c-space>',
                    scope_incremental = '<c-i>',
                    node_decremental = '<M-space>',
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                    },
                },
                move = {
                    enable = false,
                    set_jumps = false, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ['<leader>]m'] = '@function.outer',
                        ['<leader>]o'] = '@class.outer',
                    },
                    goto_next_end = {
                        ['<leader>]M'] = '@function.outer',
                        ['<leader>]o'] = '@class.outer',
                    },
                    goto_previous_end = {
                        ['<leader>[M'] = '@function.outer',
                        ['<leader>[o'] = '@class.outer',
                    },
                    goto_previous_start = {
                        ['<leader>[m'] = '@function.outer',
                        ['<leader>[o'] = '@class.outer',
                    },
                },

            }
        },
        -- There are additional nvim-treesitter modules that you can use to interact
        -- with nvim-treesitter. You should go explore a few and see what interests you:
        --
        --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
        --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    },
}
-- vim: ts=4 sts=4 sw=4 et

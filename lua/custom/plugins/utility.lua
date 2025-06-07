return {

    "mbbill/undotree",
    -- {
    --     'ck-zhang/mistake.nvim',
    --     config = function()
    --         local plugin = require 'mistake'
    --         vim.defer_fn(function()
    --             plugin.setup()
    --         end, 500)
    --
    --         vim.keymap.set('n', '<localleader>a', plugin.add_entry_under_cursor,
    --             { desc = '[M]istake add [C]urrent word' })
    --     end,
    -- },
    { "nvim-treesitter/nvim-treesitter-context" },

    {
        "jake-stewart/auto-cmdheight.nvim",
        lazy = false,
        opts = {
            -- max cmdheight before displaying hit enter prompt.
            max_lines = 5,

            -- number of seconds until the cmdheight can restore.
            duration = 2,

            -- whether key press is required to restore cmdheight.
            remove_on_key = true,

            -- always clear the cmdline after duration and key press.
            -- by default it will only happen when cmdheight changed.
            clear_always = false,
        }
    },
    {
        'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
        main = 'ibl',
        event = "BufRead",
        opts = {},
    },
    {
        "https://github.com/wellle/targets.vim",
        event = "insertEnter"
    },
    {
        'razak17/tailwind-fold.nvim',
        opts = {},
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        ft = { 'html', 'svelte', 'astro', 'vue', 'javascriptreact', 'typescriptreact', 'php', 'blade' },
        event = "BufWritePost",
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        }
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                keymaps = {
                    change = "cs"
                }
            })
        end
    }
}

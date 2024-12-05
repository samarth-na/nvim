-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
    {
        "marcussimonsen/let-it-snow.nvim",
        cmd = "LetItSnow", -- Wait with loading until command is run
        opts = {
            delay = 400,
        },
    },
    {
        'razak17/tailwind-fold.nvim',
        opts = {},
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        ft = { 'html', 'svelte', 'astro', 'vue', 'javascriptreact', 'typescriptreact', 'php', 'blade' },
        event = "BufWritePost",
    },
    {
        "https://github.com/wellle/targets.vim",
        event = "insertEnter"
    },

    {
        'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
        main = 'ibl',
        event = "BufRead",
        opts = {},
    },


    require 'kickstart/plugins/git',


    require 'kickstart/plugins/telescope',

    require 'kickstart/plugins/lspconfig',

    require 'kickstart/plugins/conform',

    require 'kickstart/plugins/cmp',

    require 'kickstart/plugins/copilot-chat',

    require 'kickstart/plugins/treesitter',

    require 'kickstart.plugins.autopairs',


    { import = 'custom.plugins' },

    { import = 'custom.plugins.languages' },

    -- require 'kickstart.plugins.debug',
    -- require 'kickstart.plugins.lint',
})


-- vim: ts=4 sts=4 sw=4 et

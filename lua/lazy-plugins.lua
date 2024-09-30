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
    { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically

    { 'https://github.com/paretje/nvim-man' },

    {
        'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
        main = 'ibl',
        opts = {},
    },


    {
        "olrtg/nvim-emmet",
        config = function()
            vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
        end,
    },

    require 'kickstart/plugins/git',

    require 'kickstart/plugins/which-key',

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

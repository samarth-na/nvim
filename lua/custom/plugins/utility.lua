return {
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

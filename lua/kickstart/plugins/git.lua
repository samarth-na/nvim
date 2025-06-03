return {

    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
    },
    {
        'lewis6991/gitsigns.nvim',
        event = "VeryLazy",
        opts = {
            signs = {
                add = { text = '+' },
                unstaged = { text = '▌' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
                normal = { text = '┆' },
                default = { text = '┆' },
            },
        },
    },
}

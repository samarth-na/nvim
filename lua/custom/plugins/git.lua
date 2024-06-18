return {

    { "tpope/vim-fugitive" },
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '┆' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
                normal = { text = '┆' },
                default = { text = '┆' },
            },
        },
    },
    {
        'kdheepak/lazygit.nvim',

    }
}

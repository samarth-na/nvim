return {

  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
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

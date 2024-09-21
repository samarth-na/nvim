return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
        opts = {
            rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
        }
    },

    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
    },


    { -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = 'ibl',
        opts = {},
    },
    {
        "nvimtools/none-ls.nvim",
        optional = true,
        opts = function(_, opts)
            local nls = require("null-ls")
            opts.sources = opts.sources or {}
            table.insert(opts.sources, nls.builtins.formatting.prettier)
        end,
    },

}
-- vim: ts=4 sts=4 sw=4 et

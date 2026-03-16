return {
    -- Your other plugin configurations...

    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        ft = { "go", "gomod" },
        config = function()
            require("go").setup()
        end,
        build = ':lua require("go.install").update_all_sync()', -- Install/update binaries
    },

    -- Other plugins...
}
-- vim: ts=4 sts=4 sw=4 et

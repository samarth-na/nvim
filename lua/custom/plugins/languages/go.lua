return {
    -- Your other plugin configurations...

    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = "FileType",                                     -- Load the plugin when a Go file is opened
        ft = { "go", "gomod" },                                 -- Specify the file types
        build = ':lua require("go.install").update_all_sync()', -- Install/update binaries
        setup = function()
            require("go").setup()
        end,
    },

    -- Other plugins...
}
-- vim: ts=4 sts=4 sw=4 et

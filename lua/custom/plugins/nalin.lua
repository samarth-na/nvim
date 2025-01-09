return {
    {
        'barrett-ruth/live-server.nvim',
        build = 'pnpm add -g live-server',
        cmd = { 'LiveServerStart', 'LiveServerStop' },
        config = true
    },
    {
        'IogaMaster/neocord',

        event = "VeryLazy"

    },
    {
        "stsewd/spotify.nvim",
        build = ":UpdateRemotePlugins",
        config = function()
            require("spotify").setup()
        end,
        init = function()
            -- Optional mappings.
            -- vim.keymap.set("n", "<leader>ss", ":Spotify play/pause<CR>", { silent = true })
            -- vim.keymap.set("n", "<leader>sj", ":Spotify next<CR>", { silent = true })
            -- vim.keymap.set("n", "<leader>sk", ":Spotify prev<CR>", { silent = true })
            -- vim.keymap.set("n", "<leader>so", ":Spotify show<CR>", { silent = true })
            -- vim.keymap.set("n", "<leader>sc", ":Spotify status<CR>", { silent = true })
        end,
    },
}
-- IMP:
-- format to add plugins:
-- inshort this file should return an array of plugin object that object first
-- should have the github repo name and second should be the plugin name
-- like samarth/plugin_name
-- if the githublink is github.com/samarth/plugin_name
--
--
-- return {
--     {
--         'plugin_name',
--     } ,  comma is required
--     {
--         'plugin_name',
--         can add opts here like
--         cmd = "loadplugin"
--         event = "when to load the plugin"
--     }
--  }

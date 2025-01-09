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

    }
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

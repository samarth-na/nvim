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

    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:


    {
        "marcussimonsen/let-it-snow.nvim",
        cmd = "LetItSnow", -- Wait with loading until command is run
        opts = {
            delay = 400,
        },
    },






    require 'kickstart/plugins/git',


    require 'kickstart/plugins/telescope',

    require 'kickstart/plugins/lspconfig',

    require 'kickstart/plugins/conform',

    require 'kickstart/plugins/cmp',

    -- require 'kickstart/plugins/copilot-chat',

    require 'kickstart/plugins/treesitter',

    require 'kickstart.plugins.autopairs',


    { import = 'custom.plugins' },

    { import = 'custom.plugins.languages' },

    -- require 'kickstart.plugins.debug',
    -- require 'kickstart.plugins.lint',
})


-- The setup config table shows all available config options with their default values:
require("neocord").setup({
    -- General options
    logo                = "auto",                -- "auto" or url
    logo_tooltip        = nil,                   -- nil or string
    main_image          = "language",            -- "language" or "logo"
    client_id           = "1157438221865717891", -- Use your own Discord application client id (not recommended)
    log_level           = nil,                   -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                    -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    blacklist           = {},                    -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    file_assets         = {},                    -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                  -- Show the timer
    global_timer        = false,                 -- if set true, timer won't update when any event are triggered

    -- Rich Presence text options
    editing_text        = "Editing %s",         -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",        -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",   -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",         -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",      -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",  -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
    terminal_text       = "Using Terminal",     -- Format string rendered when in terminal mode.
})

-- vim: ts=4 sts=4 sw=4 et

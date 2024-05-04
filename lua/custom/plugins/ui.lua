return {
    {
        'NvChad/nvim-colorizer.lua',
        opts = {
            user_default_options = {
                tailwind = true,
            }
        }
    },
    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        -- optionally, override the default options:
        config = function()
            require("tailwindcss-colorizer-cmp").setup({
                color_square_width = 2,
            })
        end
    },
    { 'ray-x/go.nvim' },

    {
        'folke/trouble.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        opts = {},
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
    },
    { 'sainnhe/edge' },

    -- Or with configuration
    {
        'navarasu/onedark.nvim',
        opts = {
            -- Main options --
            style = 'dark',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
            transparent = false,          -- Show/hide background
            term_colors = true,           -- Change terminal color as per the selected theme style
            ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
            cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

            -- toggle theme style ---
            toggle_style_key = '<leader>to',                          -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
            toggle_style_list = { 'dark', 'darker', 'cool', 'deep' }, -- List of styles to toggle between
            -- Change code style ---
            -- Options are italic, bold, underline, none
            -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
            code_style = {
                comments = 'italic',
                keywords = 'bold',
                functions = 'italic',
                strings = 'none',
                variables = 'none',
            },

            -- Lualine options --
            lualine = {
                transparent = false, -- lualine center bar transparency
            },
        },
    },
    {
        'utilyre/barbecue.nvim',
        name = 'barbecue',
        version = '*',
        dependencies = {
            'SmiteshP/nvim-navic',
        },
        opts = {},
    },
    {
        {
            'nvim-tree/nvim-tree.lua',
            lazy = true,
            config = function()
                require('nvim-tree').setup {
                    view = {
                        width = 25,
                    },
                }
            end,
        },
        {
            -- Set lualine as statusline
            'nvim-lualine/lualine.nvim',
            event = 'InsertEnter',
            opts = {
                options = {
                    icons_enabled = true,
                    -- theme = 'onedark',
                    -- theme = 'tokyonight',
                    component_separators = { left = '|', right = '|' },
                    section_separators = { left = '', right = ' ' },
                },
                sections = {
                    lualine_a = { '' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'encoding', 'filename' },
                    lualine_x = { 'fileformat' },
                    lualine_y = { 'progress', 'location' },
                    lualine_z = {},
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'diff' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {
                    lualine_a = {},
                    lualine_b = { 'buffers' },
                    lualine_c = { '' },
                    lualine_x = { 'tabs' },
                    lualine_y = {},
                    lualine_z = { 'mode' },
                },
            },
        },
    },
    {
        'folke/zen-mode.nvim',
        opts = {

            window = {
                backdrop = 0.1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                -- height and width can be:
                -- * an absolute number of cells when > 1
                -- * a percentage of the width / height of the editor when <= 1
                -- * a function that returns the width or the height
                width = 94, -- width of the Zen window
                height = 1, -- height of the Zen window
                -- by default, no options are changed for the Zen window
                -- uncomment any of the options below, or add other vim.wo options you want to apply
                options = {
                    -- signcolumn = "no", -- disable signcolumn
                    -- number = false, -- disable number column
                    -- relativenumber = false, -- disable relative numbers
                    -- cursorline = false, -- disable cursorline
                    -- cursorcolumn = false, -- disable cursor column
                    -- foldcolumn = "0", -- disable fold column
                    -- list = false, -- disable whitespace characters
                },
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = true,    -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                    -- you may turn on/off statusline in zen mode by setting 'laststatus'
                    -- statusline will be shown only if 'laststatus' == 3
                    laststatus = 0,             -- turn off the statusline in zen mode
                },
                twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
                gitsigns = { enabled = false }, -- disables git signs
                tmux = { enabled = false },     -- disables the tmux statusline
                -- this will change the font size on kitty when in zen mode
                -- to make this work, you need to set the following kitty options:
                -- - allow_remote_control socket-only
                -- - listen_on unix:/tmp/kitty
                wezterm = {
                    enabled = false,
                    -- can be either an absolute font size or the number of incremental steps
                    font = '+4', -- (10% increase per step)
                },
            },
            -- callback where you can add custom code when the Zen window opens
            -- on_open = function(win) end,
            -- callback where you can add custom code when the Zen window closes
            -- on_close = function() end,
        },
    },
}
-- vim: ts=4 sts=4 sw=4 et

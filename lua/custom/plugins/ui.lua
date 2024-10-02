return {

    ---@type LazySpec
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        keys = {
            {
                '<c-f>',
                "<cmd>Yazi toggle<cr>",
                desc = "Resume the last yazi session",
            },
        },
        opts = {
            -- if you want to open yazi instead of netrw, see below for more info
            open_for_directories = false,
            floating_window_scaling_factor = 1,
            -- use_ya_for_events_reading = true,
            -- use_yazi_client_id_flag = true,

            keymaps = {
                show_help = '?',
            },
        },
    },
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
    {
        'folke/trouble.nvim',
        opts = {
            focus = true,
            transparent = true,
        },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    {
        'navarasu/onedark.nvim',
        init = function()
            vim.cmd.colorscheme 'onedark'

            vim.cmd.hi 'Comment gui=none'
        end,
        opts = {
            -- Main options --
            style = 'dark',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
            transparent = false,          -- Show/hide background
            term_colors = false,          -- Change terminal color as per the selected theme style
            ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
            cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

            -- toggle theme style ---
            toggle_style_key = '<leader>to',                           -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
            toggle_style_list = { 'dark', 'darker', 'cool', 'light' }, -- List of styles to toggle between
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
            diagnostics = {
                darker = true,      -- darker colors for diagnostic
                undercurl = true,   -- use undercurl instead of underline for diagnostics
                background = false, -- use background color for virtual text
            },


            -- Lualine options --
            lualine = {
                transparent = false, -- lualine center bar transparency
            },
            trouble = {
                transparent = true,
            }
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

            nvimlogo = {
                function()
                    return ''
                end,
            },

            opts = {

                options = {
                    globalstatus = true,
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = { left = '|', right = '|' },
                    section_separators = { left = '', right = ' ' },
                },
                sections = {
                    lualine_a = { '' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename', 'encoding', 'filesize' },
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
                    lualine_a = { '' },
                    lualine_b = { '' },
                    lualine_c = { '', 'buffers' },
                    lualine_x = { 'tabs' },
                    lualine_y = {},
                    lualine_z = { 'mode' },
                },
            },
        },
    },
    {
        'folke/zen-mode.nvim',
        cmd = 'ZenMode',
        opts = {

            window = {
                backdrop = 1.2, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                -- height and width can be:
                -- * an absolute number of cells when > 1
                -- * a percentage of the width / height of the editor when <= 1
                -- * a function that returns the width or the height
                width = 86, -- width of the Zen window
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
                    ruler = false,   -- disables the ruler text in the cmd line area
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
                -- wezterm = {
                --     enabled = false,
                --     -- can be either an absolute font size or the number of incremental steps
                --     font = '+4', -- (10% increase per step)
                -- },
            },
            -- callback where you can add custom code when the Zen window opens
            -- on_open = function(win) end,
            -- callback where you can add custom code when the Zen window closes
            -- on_close = function() end,
        },
    },
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts =
        {
            signs = false,     -- show icons in the signs column
            sign_priority = 8, -- sign priority
            -- keywords recognized as todo comments
            keywords = {
                FIX = { --
                    icon = " ", -- icon used for the sign, and in search results
                    color = "error", -- can be a hex color, or a named color (see below)
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "IMP" }, -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = { icon = " ", color = "info", alt = { "TODO", "INFO" } },
                HACK = { icon = " ", color = "warning" },
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "X!", "NOTICE" } },
                PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = " ", color = "hint", alt = { "NOTE" } },
                TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
            },
            gui_style = {
                fg = "NONE",       -- The gui style to use for the fg highlight group.
                bg = "BOLD",       -- The gui style to use for the bg highlight group.
            },
            merge_keywords = true, -- when true, custom keywords will be merged with the defaults
            -- highlighting of the line containing the todo comment
            -- * before: highlights before the keyword (typically comment characters)
            -- * keyword: highlights of the keyword
            -- * after: highlights after the keyword (todo text)
            highlight = {
                multiline = true,                -- enable multine todo comments
                multiline_pattern = "^.",        -- lua pattern to match the next multiline from the start of the matched keyword
                multiline_context = 10,          -- extra lines that will be re-evaluated when changing a line
                before = "",                     -- "fg" or "bg" or empty
                keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
                after = "fg",                    -- "fg" or "bg" or empty
                pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
                comments_only = true,            -- uses treesitter to match keywords in comments only
                max_line_len = 400,              -- ignore lines longer than this
                exclude = {},                    -- list of file types to exclude highlighting
            },
            -- list of named colors where we try to extract the guifg from the
            -- list of highlight groups or use the hex color if hl not found as a fallback
            colors = {
                error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
                warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
                info = { "DiagnosticInfo", "#2563EB" },
                hint = { "DiagnosticHint", "#10B981" },
                default = { "Identifier", "#7C3AED" },
                test = { "Identifier", "#FF00FF" }
            },
            search = {
                command = "rg",
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                },
                -- regex that will be used to match keywords.
                -- don't replace the (KEYWORDS) placeholder
                pattern = [[\b(KEYWORDS):]], -- ripgrep regex
                -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
            },
        },
    },
    {
        'folke/which-key.nvim',
        event = 'VimEnter', -- Sets the loading event to 'VimEnter'
        config = function()
            require('which-key').setup()
            local wk = require("which-key")
            wk.add({
                { "<leader>f",      group = " Find" },
                { "<leader>s",      group = " Search" },
                { "<leader>g",      group = " Git" },
                { "<leader>l",      group = " load" },
                { "<leader>t",      group = " toggle" },
                { "<leader>x",      group = " trouble table" },
                { "<leader>tg",     group = " git" },
                { "<leader>d",      group = " document" },
                { "<localleader>q", group = " diagnostics" },
                { "<leader>c",      group = " copilot" },
                { "<leader>w",      group = " Workspace" },
                { "<localleader>d", group = " search dir" },
            })
        end,
    },
}
-- vim: ts=4 sts=4 sw=4 et

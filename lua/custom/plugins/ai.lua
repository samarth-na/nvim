return {
    -- {
    --     "yetone/avante.nvim",
    --     event = "VeryLazy",
    --     lazy = false,
    --     version = false, -- set this if you want to always pull the latest change
    --     opts = {
    --         -- add any opts here
    --     },
    --     -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    --     build = "make",
    --     -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    --     dependencies = {
    --         "stevearc/dressing.nvim",
    --         "nvim-lua/plenary.nvim",
    --         "MunifTanjim/nui.nvim",
    --         --- The below dependencies are optional,
    --         "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    --         "zbirenbaum/copilot.lua",      -- for providers='copilot'
    --         {
    --             -- support for image pasting
    --             "HakonHarnes/img-clip.nvim",
    --             event = "VeryLazy",
    --             opts = {
    --                 {
    --                     ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
    --                     provider = "copilot",                  -- Recommend using Claude
    --                     auto_suggestions_provider = "copilot", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
    --                     copilot = {
    --                         endpoint = "https://api.githubcopilot.com",
    --                         model = "gpt-4o-2024-05-13",
    --                         proxy = nil,            -- [protocol://]host[:port] Use this proxy
    --                         allow_insecure = false, -- Allow insecure server connections
    --                         timeout = 30000,        -- Timeout in milliseconds
    --                         temperature = 0,
    --                         max_tokens = 4096,
    --                     },
    --                     behaviour = {
    --                         auto_suggestions = false, -- Experimental stage
    --                         auto_set_highlight_group = true,
    --                         auto_set_keymaps = true,
    --                         auto_apply_diff_after_generation = false,
    --                         support_paste_from_clipboard = false,
    --                     },
    --                     mappings = {
    --                         --- @class AvanteConflictMappings
    --                         diff = {
    --                             ours = "co",
    --                             theirs = "ct",
    --                             all_theirs = "ca",
    --                             both = "cb",
    --                             cursor = "cc",
    --                             next = "]x",
    --                             prev = "[x",
    --                         },
    --                         suggestion = {
    --                             accept = "<M-l>",
    --                             next = "<M-]>",
    --                             prev = "<M-[>",
    --                             dismiss = "<C-]>",
    --                         },
    --                         jump = {
    --                             next = "]]",
    --                             prev = "[[",
    --                         },
    --                         submit = {
    --                             normal = "<CR>",
    --                             insert = "<C-s>",
    --                         },
    --                         sidebar = {
    --                             switch_windows = "<Tab>",
    --                             reverse_switch_windows = "<S-Tab>",
    --                         },
    --                     },
    --                     -- hints = { enabled = true },
    --                     windows = {
    --                         ---@type "right" | "left" | "top" | "bottom"
    --                         position = "right",   -- the position of the sidebar
    --                         wrap = true,          -- similar to vim.o.wrap
    --                         width = 30,           -- default % based on available width
    --                         sidebar_header = {
    --                             align = "center", -- left, center, right for title
    --                             rounded = true,
    --                         },
    --                     },
    --                     --- @class AvanteConflictUserConfig
    --                     diff = {
    --                         autojump = true,
    --                         ---@type string | fun(): any
    --                         list_opener = "copen",
    --                     },
    --                 },
    --                 default = {
    --                     embed_image_as_base64 = false,
    --                     prompt_for_file_name = false,
    --                     drag_and_drop = {
    --                         insert_mode = true,
    --                     },
    --                     -- required for Windows users
    --                     use_absolute_path = true,
    --                 },
    --             },
    --         },
    --     },
    -- },
    -- add this to the file where you setup your other plugins:
    -- {
    --     "monkoose/neocodeium",
    --     event = "VeryLazy",
    --     config = function()
    --         local neocodeium = require("neocodeium")
    --         neocodeium.setup()
    --         vim.keymap.set("i", "<C-f>", neocodeium.accept)
    --         vim.keymap.set("i", "<C-d>", neocodeium.cycle)
    --         vim.keymap.set("i", "<C-j>", neocodeium.accept_word)
    --     end,
    -- },
    -- { "github/copilot.vim" },
    {
        {
            "CopilotC-Nvim/CopilotChat.nvim",
            branch = "canary",
            dependencies = {
                { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
                { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
            },
            build = "make tiktoken",          -- Only on MacOS or Linux
            opts = {
                debug = true,                 -- Enable debugging
                -- See Configuration section for rest
            },
            -- See Commands section for default commands if you want to lazy load on them
        },
    },
    -- {
    --     "zbirenbaum/copilot-cmp",
    --     config = function()
    --         require("copilot").setup({
    --             suggestion = { enabled = true },
    --             panel = { enabled = false },
    --         })
    --     end
    -- },
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<c-j>",
                    clear_suggestion = "<C-x>",
                    accept_word = "<C-f>",
                },
                -- ignore_filetypes = { cpp = true },
                color = {
                    suggestion_color = "#ffffff",
                },
                disable_inline_completion = false, -- disables inline completion for use with cmp
                disable_keymaps = false            -- disables built in keymaps for more manual control
            })
        end,
    },

}
-- vim: ts=4 sts=4 sw=4 et

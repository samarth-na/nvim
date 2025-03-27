return {
    -- {
    --     "yetone/avante.nvim",
    --     event = "VeryLazy",
    --     version = false, -- Never set this value to "*"! Never!
    --     opts = {
    --         -- add any opts here
    --         -- for example
    --         provider = "copilot",
    --     },
    --     -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    --     build = "make",
    --     -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --         "stevearc/dressing.nvim",
    --         "nvim-lua/plenary.nvim",
    --         "MunifTanjim/nui.nvim",
    --         --- The below dependencies are optional,
    --         "echasnovski/mini.pick",         -- for file_selector provider mini.pick
    --         "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    --         "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
    --         "ibhagwan/fzf-lua",              -- for file_selector provider fzf
    --         "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
    --         "zbirenbaum/copilot.lua",        -- for providers='copilot'
    --         {
    --             -- support for image pasting
    --             "HakonHarnes/img-clip.nvim",
    --             event = "VeryLazy",
    --             opts = {
    --                 -- recommended settings
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
    --         {
    --             -- Make sure to set this up properly if you have lazy=true
    --             'MeanderingProgrammer/render-markdown.nvim',
    --             opts = {
    --                 file_types = { "markdown", "Avante" },
    --             },
    --             ft = { "markdown", "Avante" },
    --         },
    --     },
    -- },
    {
        "supermaven-inc/supermaven-nvim",
        event = "InsertEnter",
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<c-j>",
                    clear_suggestion = "<C-x>",
                    accept_word = "<C-f>",
                },
                ignore_filetypes = { cpp = false, copilotchat = true, markdown = true },
                color = {
                    suggestion_color = "#ffffff",
                },
                disable_inline_completion = false, -- disables inline completion for use with cmp
                disable_keymaps = false            -- disables built in keymaps for more manual control
            })
        end,
    },

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
}

-- vim: ts=4 sts=4 sw=4 et

return {
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

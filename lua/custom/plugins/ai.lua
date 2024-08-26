return {
    -- { "github/copilot.vim" },
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
                    -- suggestion_color = "#ffffff",
                    cterm = 244,

                },
                disable_inline_completion = false, -- disables inline completion for use with cmp
                disable_keymaps = false            -- disables built in keymaps for more manual control
            })
        end,
    },
    -- {
    --     "Exafunction/codeium.nvim",
    --     config = function()
    --         require("codeium").setup({
    --         })
    --     end
    -- },
    -- {
    --
    --     'exafunction/codeium.vim',
    --     config = function()
    --         vim.keymap.set('i', '<C-f>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    --         vim.keymap.set('i', '<c-D>', function() return vim.fn['codeium#CycleCompletions'](1) end,
    --             { expr = true, silent = true })
    --         vim.keymap.set('i', '<c-d>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
    --             { expr = true, silent = true })
    --         vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    --     end,
    -- }
}
-- vim: ts=4 sts=4 sw=4 et

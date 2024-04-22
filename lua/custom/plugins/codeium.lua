return {
    -- {
    --     "Exafunction/codeium.nvim",
    --     config = function()
    --         require("codeium").setup({
    --         })
    --     end
    -- },
    {

        'exafunction/codeium.vim',
        config = function()
            vim.keymap.set('i', '<C-f>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
            vim.keymap.set('i', '<c-D>', function() return vim.fn['codeium#CycleCompletions'](1) end,
                { expr = true, silent = true })
            vim.keymap.set('i', '<c-d>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
                { expr = true, silent = true })
            vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
        end,
    }
}
-- vim: ts=4 sts=4 sw=4 et

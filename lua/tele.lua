builtin = require 'telescope.builtin'


vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'old  opened files' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'find files' })
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = 'colorscheme' })
vim.keymap.set('n', '<leader>o', builtin.buffers, { desc = 'search in buffers(the opened files rn)' })


-- move in out of your code base and shit
vim.keymap.set('n', '<leader>sj', builtin.jumplist, { desc = ' find in jumplist' })
vim.keymap.set('n', '<leader>sq', builtin.quickfix, { desc = ' find in quickfix' })
vim.keymap.set('n', '<leader>ss', builtin.treesitter, { desc = ' search symbol in the buffer' })
vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = 'search marks ' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'search by grep' })
vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = 'search marks ' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'search by grep' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Search current Word' })
vim.keymap.set('n', '<leader>sx', builtin.diagnostics, { desc = 'Search Diagnostics' })

-- extra telescope
vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = 'search commands' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search Help' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search Keymaps' })
vim.keymap.set('n', '<leader>st', builtin.builtin, { desc = 'Search Telescope builtin' })
--resume last search
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Search Resume' })

-- git
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search git files' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Search git commits' })



vim.keymap.set('n', '<leader>gg', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 1,
        previewer = false,
    })
end, { desc = ' Fuzzily search in current buffer' })



vim.keymap.set('n', '<leader>gg', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 1,
        previewer = false,
    })
end, { desc = ' Fuzzily search in current buffer' })



vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 1,
        previewer = false,
    })
end, { desc = ' Fuzzily search in current buffer' })



vim.keymap.set('n', '<leader><space>', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.find_files(require('telescope.themes').get_ivy {
        winblend = 0,
        previewer = true,
    })
end, { desc = 'find in files ' })



vim.keymap.set('n', '<leader>sg', function()
    builtin.live_grep(require('telescope.themes').get_ivy {
        winblend = 0,
        previewer = true,

    })
end, { desc = 'find in files ' })



vim.keymap.set('n', 'zs', function()
    builtin.spell_suggest(require('telescope.themes').get_cursor {
        winblend = 0,
        previewer = true,
        layout_config = {
            width = 30,
            height = 20,
        }
    })
end, { desc = 'find in files ' })




-- Also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
    builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
    }
end, { desc = 'Search in Open Files' })


vim.keymap.set('n', '<leader>sn', function()
    builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = 'Search Neovim files' })
-- vim: ts=4 sts=4 sw=4 et

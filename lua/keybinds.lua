-- Move focus to the left window
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })

-- Move focus to the right window
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

-- Move focus to the lower window
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })

-- Move focus to the upper window
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Map Ctrl-h to move cursor left in insert mode
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true })

-- Map Ctrl-l to move cursor right in insert mode
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true })

-- Map Ctrl-j to move cursor down in insert mode
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true })

-- Map Ctrl-k to move cursor up in insert mode
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true })

-- Map Meta-q to close current window
vim.keymap.set({ 'n', 'v' }, '<M-q>', ':q<CR>', { silent = true })

-- Map Ctrl-Q to forcefully close all windows
vim.keymap.set({ 'n', 'v' }, '<c-Q>', ':qa!<CR>', { silent = true })

-- Map Ctrl-s to save current buffer
vim.keymap.set({ 'n', 'v' }, '<C-s>', ':w<CR> ', { silent = true })

-- Map Ctrl-x to delete current buffer
vim.api.nvim_set_keymap('n', '<C-x>', ':bdelete<CR>', { noremap = true, silent = true })

-- Execute 'ctp' command in the terminal
vim.api.nvim_set_keymap('n', '<M-t>', ':! ctp <CR>', { noremap = true })

-- Execute 'run' command in the terminal
vim.api.nvim_set_keymap('n', '<M-r>', ':! run <CR>', { noremap = true })

-- Keep the cursor centered after Ctrl-d and Ctrl-u
vim.keymap.set('n', '<C-d>', "<c-d>zz")
vim.keymap.set('n', '<C-u>', "<c-u>zz")

-- Keep the cursor centered after 'n' and 'N' commands
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

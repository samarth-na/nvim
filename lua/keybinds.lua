-- WARN: Move focus to the other window

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('i', '<C-e>', '<Esc>', { desc = '' })

-- WARN: Map alt-q/alt-Q to close current window
vim.keymap.set({ 'n', 'v' }, '<M-q>', ':q<CR>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<M-Q>', ':qa!<CR>', { silent = true })

-- WARN: shell commands
vim.api.nvim_set_keymap('n', '<M-t>', ':!changeTmuxPane <CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-r>', ':! ~/.zsh/scripts/run.sh <CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-g>', ':!gin && tg <CR>', { noremap = true })

-- NOTE: Map Ctrl-s to save current buffer
vim.keymap.set({ 'n', 'v' }, '<C-s>', ':w<CR> ', { silent = true })

-- NOTE: Map Ctrl-x to delete current buffer
vim.api.nvim_set_keymap('n', '<C-x>', ':NvimTreeClose | bdelete<CR>', { noremap = true, silent = true })

-- NOTE: Keep the cursor centered after Ctrl-d and Ctrl-u
vim.keymap.set('n', '<C-d>', "<c-d>zz")
vim.keymap.set('n', '<C-u>', "<c-u>zz")

-- NOTE: Keep the cursor centered after 'n' and 'N' commands
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- X!: exit to normal mode
vim.keymap.set({ 'i' }, 'jk', '<Esc>', { silent = true })
vim.keymap.set({ 'i' }, 'jj', '<Esc>', { silent = true })

--  X!: diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })

-- X!: terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set({ 'n' }, '<Esc>', ':nohlsearch <CR>', { silent = true })

-- X!: word remaps
vim.keymap.set({ 'n' }, 'dw', 'diw', { silent = true })
vim.keymap.set({ 'n' }, 'yw', 'yiw', { silent = true })
vim.keymap.set({ 'n' }, 'cw', 'ciw', { silent = true })

-- X!: visual mode
vim.keymap.set({ 'n' }, 'vv', 'V', { silent = true })

-- X!: end and start of line
vim.api.nvim_set_keymap('n', 'L', '$', { noremap = true })
vim.api.nvim_set_keymap('n', 'H', '0', { noremap = true })
-- X!: NOTE j and k moment
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- X!: Switch to next buffer
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<s-Tab>', ':bNext<CR>', { noremap = true, silent = true })


-- X!: Switch to next tab
vim.api.nvim_set_keymap('n', '<leader><Tab>', ':tabnext<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<leader>ll', ':Lazy<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lc', ':CopilotChat <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lm', ':Mason<CR>', { noremap = true, silent = true })
-- X!: NOTE plugin keymaps

-- NOTE: zen mode
vim.api.nvim_set_keymap("n", "<leader>z", ":ZenMode<cr>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<localleader>z", ":ZenMode<cr>",
  { noremap = true, silent = true })

-- NOTE: for trouble
vim.api.nvim_set_keymap('n', '<leader>xx', ':Trouble<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<localleader>q', ':Trouble diagnostics<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xr', ':Trouble lsp_references<CR>',
  { noremap = true, silent = true })

-- NOTE: for nvim-tree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<localleader>=', '<C-w>o<CR>',
  { noremap = true, silent = true })

-- NOTE: for git
vim.api.nvim_set_keymap('n', '<leader>tgd', ':Gitsigns toggle_deleted<CR>',
  { noremap = true, silent = true, desc = "togle git deleted" })
vim.api.nvim_set_keymap('n', '<leader>tgl', ':Gitsigns toggle_current_line_blame<CR>',
  { noremap = true, silent = true, desc = "Toggle current line blame" })
vim.api.nvim_set_keymap('n', '<leader>gS', ':Gitsigns <CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gh', ':Gitsigns preview_hunk<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gd', ':Gitsigns  diffthis<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lg', ':!gin && tg <CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>fg', ':Gitsigns <CR>',
  { noremap = true, silent = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et

-- set leader key to space
vim.g.mapleader = ' '

vim.g.maplocalleader = ' '

-- set number line
vim.wo.number = true

vim.wo.relativenumber = true

vim.opt.tabstop = 4

vim.opt.cursorline = true

vim.opt.shiftwidth = 4

vim.opt.expandtab = true

vim.g.have_nerd_font = true

vim.g.vim_markdown_folding_disabled = 1

vim.g.vim_markdown_auto_insert_bullets = 0

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, for help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 150

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 250

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 16

vim.opt.hlsearch = true

vim.opt.colorcolumn = '88'

vim.opt.linebreak = true

vim.opt.conceallevel = 1

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Function to load Codeium plugins
-- local function load_codeium()
--   local status_ok, lazy = pcall(require, "lazy")
--   if not status_ok then
--     print("Failed to load lazy.nvim")
--     return
--   end
--
--   lazy.load({ "Exafunction/codeium.nvim", "exafunction/codeium.vim" })
-- end

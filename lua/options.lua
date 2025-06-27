-- [[ Setting options ]]
-- See `:help vim.opt`

vim.o.shell = "/usr/bin/fish"
vim.o.shellcmdflag = "-c"
-- vim.o.shellredir = ">%s 2>&1"
-- vim.o.shellpipe = "| tee"
-- vim.o.shellquote = ""
-- vim.o.shellxquote = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.o.wrap = true
vim.o.textwidth = 88
vim.o.linebreak = false

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.cursorline = true

vim.g.have_nerd_font = true

vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 300

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 250

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Enable virtualedit for block mode (allows selecting beyond text)
vim.opt.virtualedit = "block"

vim.opt.hlsearch = true

vim.opt.linebreak = true

vim.opt.conceallevel = 1

vim.opt.autoindent = true
vim.opt.smartindent = true
-- vim: ts=4 sts=4 sw=4 et

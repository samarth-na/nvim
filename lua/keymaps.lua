vim.keymap.set({ "i" }, "jk", "<Esc>", { silent = true })
vim.keymap.set({ "i" }, "jj", "<Esc>", { silent = true })

vim.keymap.set({ "n", "v" }, "<D-v>", '"+p', { silent = true })
vim.keymap.set("i", "<D-v>", '<C-r>+', { silent = true })
vim.keymap.set("c", "<D-v>", '<C-r>+', { silent = true })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })

vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>", { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>", { desc = "Go to next [D]iagnostic message" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set({ "n" }, "<Esc><Esc>", ":nohlsearch <CR>", { silent = true })

vim.api.nvim_set_keymap("n", "<localleader>=", "<C-w>o<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n" }, "dw", "diw", { silent = true })
vim.keymap.set({ "n" }, "yw", "yiw", { silent = true })
vim.keymap.set({ "n" }, "cw", "ciw", { silent = true })
vim.keymap.set({ "n" }, "di<space>", "diW", { silent = true })
vim.keymap.set({ "n" }, "ci<space>", "ciW", { silent = true })
vim.keymap.set({ "n" }, "yi<space>", "yiW", { silent = true })

vim.keymap.set({ "n" }, "vv", "V", { silent = true })

vim.api.nvim_set_keymap("n", "L", "$", { noremap = true })
vim.api.nvim_set_keymap("n", "H", "0", { noremap = true })

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<s-Tab>", ":bNext<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader><Tab>", ":tabnext<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>ll", ":Lazy<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lm", ":Mason<CR>", { noremap = true, silent = true })

-- toggle stuff
vim.api.nvim_set_keymap("n", "<leader>as", ":SupermavenToggle <CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>th", function()
	require("snacks").picker.colorschemes()
end, { desc = "Browse themes" })
vim.keymap.set("n", "<leader>lw", ":LspStart tailwindcss<CR>", { desc = "Start Tailwind CSS LSP" })
vim.keymap.set("n", "<leader>lt", ":LspStart ts_ls<CR>", { desc = "Start TypeScript LSP" })

vim.api.nvim_set_keymap("n", "<leader>ti", ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>tS", ":set spell <CR>", { noremap = true, silent = true })

lspDiagnosticsVisible = true
vim.diagnostic.config({
	virtual_text = lspDiagnosticsVisible,
	underline = lspDiagnosticsVisible,
})

vim.keymap.set("n", "<leader>td", function()
	lspDiagnosticsVisible = not lspDiagnosticsVisible
	vim.diagnostic.config({
		virtual_text = lspDiagnosticsVisible,
		underline = lspDiagnosticsVisible,
	})
end, { desc = "Toggle diagnostics" })

vim.api.nvim_set_keymap("n", "<leader>tc", ":TSContextToggle<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", function()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[buf].filetype == "snacks_dashboard" then
			vim.api.nvim_buf_delete(buf, { force = true })
			break
		end
	end
	vim.cmd("NvimTreeToggle")
end, { noremap = true, silent = true })

-- markdown preview
vim.api.nvim_set_keymap("n", "<leader>mp", ":MarkdownPreview<CR>", { noremap = true, silent = true })

-- zen mode (snacks)
vim.keymap.set("n", "<leader>z", function()
	Snacks.zen()
end, { desc = "Zen Mode" })

--  for trouble
vim.api.nvim_set_keymap("n", "<leader>xx", ":Trouble<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>qq", ":Trouble diagnostics<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<localleader>q", ":Trouble diagnostics<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>xr", ":Trouble lsp_references<CR>", { noremap = true, silent = true })

--  for nvim-tree

-- NOTE: for git
vim.keymap.set("n", "<leader>lg", ":!tg <CR>", { noremap = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.bmp", "*.tiff", "*.webp", "*.svg", "*.ico" },
	group = vim.api.nvim_create_augroup("image-preview", { clear = true }),
	callback = function()
		vim.bo.buftype = "nowrite"
		vim.bo.modifiable = false
		vim.bo.readonly = true
	end,
})

local function toggle_boolean()
	local word = vim.fn.expand("<cword>")
	if word == "true" then
		vim.api.nvim_feedkeys([["_diw]], "n", false)
		vim.schedule(function()
			vim.api.nvim_put({ "false" }, "c", false, true)
		end)
	elseif word == "false" then
		vim.api.nvim_feedkeys([["_diw]], "n", false)
		vim.schedule(function()
			vim.api.nvim_put({ "true" }, "c", false, true)
		end)
	end
end

-- ai tools
vim.keymap.set("n", "<leader>ak", function()
	Snacks.terminal({ cmd = "kilo" })
end, { desc = "Kilo AI" })

vim.keymap.set("n", "<leader>ao", function()
	vim.cmd("Opencode toggle")
end, { desc = "OpenCode" })

vim.api.nvim_create_autocmd("User", {
	pattern = "OpencodeToggle",
	callback = function()
		vim.defer_fn(function()
			vim.cmd("only")
		end, 100)
	end,
})

-- Create a keymap for normal mode

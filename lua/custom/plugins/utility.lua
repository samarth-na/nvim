return {
	{
		"mbbill/undotree",
		cmd = { "UndotreeToggle", "UndotreeShow", "UndotreeHide", "UndotreeFocus" },
	},
	-- {
	--     'ck-zhang/mistake.nvim',
	--     config = function()
	--         local plugin = require 'mistake'
	--         vim.defer_fn(function()
	--             plugin.setup()
	--         end, 500)
	--
	--         vim.keymap.set('n', '<localleader>a', plugin.add_entry_under_cursor,
	--             { desc = '[M]istake add [C]urrent word' })
	--     end,
	-- },
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufReadPost",
		cmd = { "TSContextToggle" },
	},

	{
		"jake-stewart/auto-cmdheight.nvim",
		event = "CmdlineEnter",
		opts = {
			max_lines = 5,
			duration = 2,
			remove_on_key = true,
			clear_always = false,
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "BufReadPost",
		opts = {},
	},
	{
		"https://github.com/wellle/targets.vim",
		event = "InsertEnter",
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},

	{
		"echasnovski/mini.ai",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.splitjoin",
		version = "*",
		event = "VeryLazy",
		opts = {
			mappings = {
				toggle = "<leader>tj",
			},
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			modes = {
				search = { enabled = false },
			},
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		event = "VeryLazy",
		keys = {
			{
				"<leader>re",
				function()
					require("refactoring").refactor("Extract Function")
				end,
				desc = "Extract function",
				mode = "v",
			},
			{
				"<leader>rv",
				function()
					require("refactoring").refactor("Extract Variable")
				end,
				desc = "Extract variable",
				mode = "v",
			},
			{
				"<leader>ri",
				function()
					require("refactoring").refactor("Inline Variable")
				end,
				desc = "Inline variable",
			},
			{
				"<leader>rb",
				function()
					require("refactoring").refactor("Extract Block")
				end,
				desc = "Extract block",
			},
		},
	},
}

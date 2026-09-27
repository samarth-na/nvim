return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			terminal = {},
			picker = {},
			notifier = { enabled = true },
			dashboard = {
				preset = {
					header = [[
███╗   ██╗███████╗██████╗ ██████╗ ███████╗██╗   ██╗
████╗  ██║██╔════╝██╔══██╗██╔══██╗██╔════╝██║   ██║
██╔██╗ ██║█████╗  ██████╔╝██║  ██║█████╗  ██║   ██║
██║╚██╗██║██╔══╝  ██╔══██╗██║  ██║██╔══╝  ╚██╗ ██╔╝
██║ ╚████║███████╗██║  ██║██████╔╝███████╗ ╚████╔╝
╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝  ╚═══╝]],
				},
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "recent_files", cwd = true, limit = 6, padding = 1 },
					{ section = "projects", padding = 1 },
				},
			},
			image = {
				enable = true,
				doc = { enable = true },
			},
			indent = {
				enabled = true,
				animate = { enabled = false },
			},
			scope = { enabled = true },
			zen = { enabled = true },
			lazygit = { configure = true },
		},
		keys = {
			{
				"<leader>gg",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gb",
				function()
					Snacks.lazygit.blame_line()
				end,
				desc = "Lazygit Blame Line",
			},
			{
				"<C-/>",
				function()
					Snacks.terminal()
				end,
				desc = "Toggle terminal",
				mode = { "n", "t" },
			},
		},
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
	},

	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
	},

	{
		"rebelot/kanagawa.nvim",
		lazy = true,
	},

	{
		"Mofiqul/dracula.nvim",
		lazy = true,
	},

	{
		"EdenEast/nightfox.nvim",
		lazy = true,
	},

	{
		"scottmckendry/cyberdream.nvim",
		lazy = true,
	},

	{
		"sainnhe/edge",
		lazy = true,
	},
	-- {
	--     'stevearc/oil.nvim',
	--     ---@module 'oil'
	--     ---@type oil.SetupOpts
	--     opts = {},
	--     -- Optional dependencies
	--     dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	-- },

	{
		"petertriho/nvim-scrollbar",
		event = "BufReadPost",

		dependencies = { "kevinhwang91/nvim-hlslens" },
		config = function()
			require("scrollbar.handlers.gitsigns").setup()
			require("scrollbar").setup({
				show = true,
				show_in_active_only = true,
				set_highlights = true,
				folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
				max_lines = false, -- disables if no. of lines in buffer exceeds this
				hide_if_all_visible = false, -- Hides everything if all lines are visible
				throttle_ms = 100,
				handle = {
					text = " ",
					blend = 80, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
					color = "#ffffff",
					color_nr = nil, -- cterm
					highlight = "CursorColumn",
					hide_if_all_visible = true, -- Hides handle if all lines are visible
				},
				marks = {
					Cursor = {
						text = "•",
						priority = 0,
						highlight = "Normal",
					},
					Search = {
						text = { "-", "=" },
						priority = 1,
						highlight = "Search",
					},
					Error = {
						text = { "E", "E" },
						priority = 2,
						highlight = "DiagnosticVirtualTextError",
					},
					Warn = {
						text = { "W", "W" },
						priority = 3,
						highlight = "DiagnosticVirtualTextWarn",
					},
					Info = {
						text = { "I", "I" },
						priority = 4,
						highlight = "DiagnosticVirtualTextInfo",
					},
					Hint = {
						text = { "H", "H" },
						priority = 5,
						highlight = "DiagnosticVirtualTextHint",
					},
					Misc = {
						text = { "-", "=" },
						priority = 6,
						highlight = "Normal",
					},
					GitAdd = {
						text = "┆",
						priority = 7,
						highlight = "GitSignsAdd",
					},
					GitChange = {
						text = "┆",
						priority = 7,
						highlight = "GitSignsChange",
					},
					GitDelete = {
						text = "▁",
						priority = 7,
						highlight = "GitSignsDelete",
					},
				},
				excluded_buftypes = {
					"terminal",
				},
				excluded_filetypes = {
					"cmp_docs",
					"cmp_menu",
					"noice",
					"prompt",
					"TelescopePrompt",
				},
				autocmd = {
					render = {
						"BufWinEnter",
						"TabEnter",
						"TermEnter",
						"WinEnter",
						"CmdwinLeave",
						"TextChanged",
						"VimResized",
						"WinScrolled",
					},
					clear = {
						"BufWinLeave",
						"TabLeave",
						"TermLeave",
						"WinLeave",
					},
				},
				handlers = {
					cursor = true,
					diagnostic = true,
					gitsigns = true, -- Requires gitsigns
					handle = true,
					search = true, -- Requires hlslens
					ale = false, -- Requires ALE
				},
			})
		end,
	},
	{
		"mikavilpas/yazi.nvim",
		keys = {
			{
				"<leader>y",
				"<cmd>Yazi<cr>",
				desc = "Open yazi",
			},
			{
				"<c-f>",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			floating_window_scaling_factor = 1,
			-- use_ya_for_events_reading = true,
			-- use_yazi_client_id_flag = true,

			keymaps = {
				show_help = "?",
			},
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPost",
		opts = {
			user_default_options = {
				tailwind = true,
			},
		},
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		event = "BufReadPost",

		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {
			focus = true,
			transparent = true,
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"folke/tokyonight.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"navarasu/onedark.nvim",
		init = function()
			-- vim.cmd.colorscheme("onedark")
			vim.cmd.colorscheme("tokyonight-storm")

			vim.cmd.hi("Comment gui=none")
		end,
		opts = {
			-- Main options --
			style = "cool", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
			transparent = false, -- Show/hide background
			term_colors = false, -- Change terminal color as per the selected theme style
			ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
			cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

			toggle_style_key = "<leader>to", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
			toggle_style_list = { "cool", "light" }, -- List of styles to toggle between
			-- Change code style ---
			-- Options are italic, bold, underline, none
			-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
			code_style = {
				comments = "italic",
				keywords = "bold",
				functions = "italic",
				strings = "none",
				variables = "none",
			},
			diagnostics = {
				darker = true, -- darker colors for diagnostic
				undercurl = true, -- use undercurl instead of underline for diagnostics
				background = false, -- use background color for virtual text
			},

			lualine = {
				transparent = false,
			},
		},
	},
	{
		"utilyre/barbecue.nvim",
		event = "BufReadPost",
		name = "barbecue",
		-- version = '*',
		dependencies = {
			"SmiteshP/nvim-navic",
		},
		opts = {},
	},
	{
		{
			"nvim-tree/nvim-tree.lua",
			cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFile" },
			config = function()
				require("nvim-tree").setup({
					view = {
						width = 25,
					},
				})
			end,
		},
		{
			"nvim-lualine/lualine.nvim",
			event = { "BufReadPost", "BufNewFile" },

			opts = {

				options = {
					globalstatus = true,
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "|", right = "|" },
					section_separators = { left = "", right = " " },
				},
				sections = {
					lualine_a = { "" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "encoding", "filesize" },
					lualine_x = { "fileformat" },
lualine_y = { "progress", "location" },
				lualine_z = { "searchcount" },
			},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "diff" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {
					lualine_a = { "" },
					lualine_b = { "" },
					lualine_c = { "buffers" },
					lualine_x = { "tabs" },
					lualine_y = {},
					lualine_z = { "mode" },
				},
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		event = "BufReadPost",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = false, -- show icons in the signs column
			sign_priority = 8, -- sign priority
			-- keywords recognized as todo comments
			keywords = {
				FIX = { --
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "IMP" }, -- a set of other keywords that all map to this FIX keywords
					-- signs = false, -- configure signs for some keywords individually
				},
				TODO = { icon = " ", color = "info", alt = { "TODO", "INFO", "START" } },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "X!", "NOTICE" } },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "NOTE" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
			gui_style = {
				fg = "NONE", -- The gui style to use for the fg highlight group.
				bg = "BOLD", -- The gui style to use for the bg highlight group.
			},
			merge_keywords = true, -- when true, custom keywords will be merged with the defaults
			-- highlighting of the line containing the todo comment
			-- * before: highlights before the keyword (typically comment characters)
			-- * keyword: highlights of the keyword
			-- * after: highlights after the keyword (todo text)
			highlight = {
				multiline = true, -- enable multine todo comments
				multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
				multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
				before = "", -- "fg" or "bg" or empty
				keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
				after = "fg", -- "fg" or "bg" or empty
				pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
				comments_only = true, -- uses treesitter to match keywords in comments only
				max_line_len = 400, -- ignore lines longer than this
				exclude = {}, -- list of file types to exclude highlighting
			},
			-- list of named colors where we try to extract the guifg from the
			-- list of highlight groups or use the hex color if hl not found as a fallback
			colors = {
				error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
				warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
				info = { "DiagnosticInfo", "#2563EB" },
				hint = { "DiagnosticHint", "#10B981" },
				default = { "Identifier", "#7C3AED" },
				test = { "Identifier", "#FF00FF" },
			},
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
				},
				-- regex that will be used to match keywords.
				-- don't replace the (KEYWORDS) placeholder
				pattern = [[\b(KEYWORDS):]], -- ripgrep regex
				-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup()
			local wk = require("which-key")
wk.add({
				{ "<leader>f", group = " Find" },
				{ "<leader>s", group = " Search" },
				{ "<leader>g", group = " Git" },
				{ "<leader>l", group = " load" },
				{ "<leader>t", group = " toggle" },
				{ "<leader>x", group = " trouble table" },
				{ "<leader>tg", group = " git" },
				{ "<leader>d", group = " document" },
				{ "<localleader>q", group = " diagnostics" },
			{ "<leader>a", group = " ai" },
			{ "<leader>o", group = " opencode" },
			{ "<leader>k", group = " kilo" },
				{ "<leader>r", group = " refactor" },
				{ "<leader>w", group = " Workspace" },
				{ "<localleader>d", group = " search dir" },
			})
		end,
	},

	{
		"rmagatti/auto-session",
		lazy = false,
		opts = {
			log_level = "error",
			suppressed_dirs = { "~/", "~/Downloads", "/" },
			auto_restore = true,
			auto_create = true,
			post_restore_cmds = {
				function()
					vim.schedule(function()
						local bufs = vim.fn.getbufinfo({ buflisted = 1, bufloaded = 1 })
						local real_bufs = 0
						for _, b in ipairs(bufs) do
							local name = vim.fn.fnamemodify(b.name, ":t")
							if b.name ~= "" and name ~= "NvimTree_1" and vim.bo[b.bufnr].buftype == "" then
								real_bufs = real_bufs + 1
							end
						end
						if real_bufs == 0 then
							vim.cmd("silent! NvimTreeClose")
							vim.cmd("silent! enew")
							if Snacks and Snacks.dashboard then
								Snacks.dashboard()
							end
						end
					end)
				end,
			},
		},
	},
}
-- vim: ts=4 sts=4 sw=4 et

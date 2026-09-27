return {
	-- {
	--     "epwalsh/obsidian.nvim",
	--     version = "*", -- recommended, use latest release instead of latest commit
	--     lazy = true,
	--     ft = "markdown",
	--
	--     dependencies = {
	--         "nvim-lua/plenary.nvim",
	--
	--     },
	--     opts = {
	--         workspaces = {
	--             {
	--                 name = "obsidian_vauld",
	--                 path = "~/obsidian"
	--             },
	--         },
	--     },
	-- },
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
		cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
	},
	{
		"tadmccorkle/markdown.nvim",
		ft = "markdown", -- or 'event = "VeryLazy"'
		opts = {
			-- configuration here or empty for defaults
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "mdx", "opencode_output" },
		opts = {
			checkbox = {
				unchecked = {
					icon = "󰄱 ",
					highlight = "RenderMarkdownLink",
					scope_highlight = nil,
				},
				checked = {
					icon = "󰱒 ",
					highlight = "RenderMarkdownLink",
					scope_highlight = nil,
				},
			},
			latex = { enabled = false },
			bullet = {
				highlight = "RenderMarkdownBullet",
				enabled = true,
				icons = { " " },
				ordered_icons = {},
				left_pad = 0,
				right_pad = 0,
				highlight = "RenderMarkdownBullet",
			},
			heading = {
				enabled = true,
				sign = false,
				position = "overlay",
				icons = { "  ", " 󰛄  ", "󰫢  ", "󰫣  ", "󰫤  ", "󰫥  " },
				signs = { " " },
				width = "full",
				left_pad = 0,
				right_pad = 0,
				min_width = 0,
				border = false,
				border_prefix = false,
				above = "▄",
				below = "▀",
				backgrounds = {
					"RenderMarkdownH1Bg",
					"RenderMarkdownH2Bg",
					"RenderMarkdownH3Bg",
					"RenderMarkdownH4Bg",
					"RenderMarkdownH5Bg",
					"RenderMarkdownH6Bg",
				},
				foregrounds = {
					"RenderMarkdownH1",
					"RenderMarkdownH2",
					"RenderMarkdownH3",
					"RenderMarkdownH4",
					"RenderMarkdownH5",
					"RenderMarkdownH6",
				},
			},
			code = {
				enabled = true,
				style = "full",
				border = "thin",
				width = "full",
				language = true,
				language_name = true,
				language_info = true,
				highlight = "RenderMarkdownCode",
				highlight_border = "RenderMarkdownCodeBorder",
				highlight_info = "RenderMarkdownCodeInfo",
				highlight_inline = "RenderMarkdownCodeInline",
				left_pad = 1,
				right_pad = 1,
				background_inset = 1,
			},
			pipe_table = {
				enabled = true,
				preset = "round",
				cell = "padded",
				padding = 1,
				border = {
					"┌", "┬", "┐",
					"├", "┼", "┤",
					"└", "┴", "┘",
					"│", "─",
				},
			},
			quote = {
				enabled = true,
				icon = "▋",
				repeat_linebreak = false,
				highlight = {
					"RenderMarkdownQuote1",
					"RenderMarkdownQuote2",
					"RenderMarkdownQuote3",
					"RenderMarkdownQuote4",
					"RenderMarkdownQuote5",
					"RenderMarkdownQuote6",
				},
			},

			indent = {
				enabled = true,
				icon = "│",
			},
		},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},
}

return {
	-- Cellular automaton - make your code melt/rain
	{
		"eandrju/cellular-automaton.nvim",
		cmd = "CellularAutomaton",
		keys = {
			{ "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Make it rain" },
			{ "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>", desc = "Game of Life" },
		},
	},

	-- Matrix digital rain screensaver
	{
		"wolfwfr/vimatrix.nvim",
		cmd = "VimatrixOpen",
		keys = {
			{ "<leader>mx", "<cmd>VimatrixOpen<CR>", desc = "Toggle Matrix rain" },
		},
		opts = {
			alphabet = "katakana",
			colourscheme = "matrix",
		},
	},

	-- Smooth animations for yank/paste/search/undo
	{
		"rachartier/tiny-glimmer.nvim",
		event = "VeryLazy",
		opts = {
			enable = true,
			animations = {
				yank = { enabled = true, effect = "fade" },
				paste = { enabled = true, effect = "bounce" },
				search = { enabled = true, effect = "pulse" },
				undo = { enabled = true, effect = "reverse_fade" },
				redo = { enabled = true, effect = "fade" },
			},
		},
	},
}

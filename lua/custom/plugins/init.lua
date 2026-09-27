-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{ "vyfor/cord.nvim", event = "VeryLazy" },

	{
		"debugloop/telescope-undo.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope.nvim",
				dependencies = { "nvim-lua/plenary.nvim" },
			},
		},
		keys = {
			{
				"<leader>su",
				"<cmd>Telescope undo<cr>",
				desc = "Undo history",
			},
		},
		config = function()
			require("telescope").setup({})
			require("telescope").load_extension("undo")
		end,
	},

	{ "tpope/vim-dadbod", cmd = "DB" },
}
-- vim: ts=4 sts=4 sw=4 et

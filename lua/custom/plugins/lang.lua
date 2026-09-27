return {
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		ft = { "rust" },
	},

	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
	},
}
-- vim: ts=4 sts=4 sw=4 et

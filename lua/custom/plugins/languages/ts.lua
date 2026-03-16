return {
	{
		"razak17/tailwind-fold.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = { "html", "javascriptreact", "svelte", "astro", "vue", "typescriptreact", "php", "blade" },
	},
	{
		"davidmh/mdx.nvim",
		ft = { "mdx" },
		config = true,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}

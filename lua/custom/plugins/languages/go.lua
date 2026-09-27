return {
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		ft = { "go", "gomod" },
		config = function()
			require("go").setup({
				goimport = "gopls",
				gofmt = "gofmt",
				max_line_len = 120,
				tag_transform = false,
				test_template = "",
				test_template_dir = "",
				verbose = false,
				lsp_cfg = true,
				lsp_gofumpt = true,
				lsp_on_attach = true,
				lsp_codelens = true,
				dap_debug = true,
			})
		end,
		build = ':lua require("go.install").update_all_sync()',
	},
}
-- LSP Plugins
return {

	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%. uv" } },
			},
		},
	},
	{
		-- Main LSP Configuration
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			{
				"j-hui/fidget.nvim",
				tag = "v1.5.0",
				opts = {
					integration = {
						["nvim-tree"] = {
							enable = true,
						},
					},
				},
			},

			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", function() Snacks.picker.lsp_definitions() end, "[G]oto [D]efinition")
					map("gr", function() Snacks.picker.lsp_references() end, "[G]oto [R]eferences")
					map("gI", function() Snacks.picker.lsp_implementations() end, "[G]oto [I]mplementation")
					map("<leader>D", function() Snacks.picker.lsp_type_definitions() end, "Type [D]efinition")
					map("<leader>ds", function() Snacks.picker.lsp_symbols() end, "[D]ocument [S]ymbols")
					map(
						"<leader>ws",
						function() Snacks.picker.lsp_workspace_symbols() end,
						"[W]orkspace [S]ymbols"
					)
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					local client = vim.lsp.get_client_by_id(event.data.client_id)

					if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			require("mason").setup()

			local ensure_installed = {
				"stylua",
				"lua_ls",
				"html-lsp",
				"rust-analyzer",
				"clang-format",
				"biome",
				"rustywind",
				"prettier",
				"prettierd",
				"black",
				"google-java-format",
			}
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			local lspconfig = require("lspconfig")

			-- Default setup function for mason-lspconfig
			local default_setup = function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end

			-- Setup mason-lspconfig for auto-installing and setting up servers
			require("mason-lspconfig").setup({
				automatic_enable = {
					exclude = { "rust_analyzer" },
				},
				ensure_installed = {
					"lua_ls",
					"basedpyright",
					"clangd",
					"tailwindcss",
					"ts_ls",
					"prismals",
				},
				handlers = {
					-- Default handler
					default_setup,

					-- Custom Lua LSP
					lua_ls = function()
						lspconfig.lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									hint = {
										enable = true,
										onlyCurrentLine = false,
									},
									completion = {
										callSnippet = "Replace",
									},
								},
							},
						})
					end,

					-- Custom Python LSP
					basedpyright = function()
						lspconfig.basedpyright.setup({
							capabilities = capabilities,
							settings = {
								basedpyright = {
									analysis = {
										autoSearchPaths = true,
										diagnosticMode = "openFilesOnly",
										useLibraryCodeForTypes = true,
									},
								},
							},
						})
					end,

					-- Custom Clangd
					clangd = function()
						lspconfig.clangd.setup({
							capabilities = capabilities,
						})
					end,
				},
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et

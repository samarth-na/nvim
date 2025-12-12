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

					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					local client = vim.lsp.get_client_by_id(event.data.client_id)

					-- KILL ts_ls if we're in a Deno project
					if client and client.name == "ts_ls" then
						local bufnr = event.buf
						local has_deno = vim.fs.root(bufnr, { "deno.json", "deno. jsonc" })
						if has_deno then
							vim.notify("Stopping ts_ls in Deno project", vim.log.levels.WARN)
							vim.lsp.stop_client(client.id, true)
							return
						end
					end

					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
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

					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
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
				"prettierd",
				"html-lsp",
				"clang-format",
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
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"basedpyright",
					"clangd",
					"denols",
					"ts_ls",
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

					-- Custom Rust Analyzer
					rust_analyzer = function()
						lspconfig.rust_analyzer.setup({
							capabilities = capabilities,
							settings = {
								["rust-analyzer"] = {
									diagnostics = {
										disabled = { "unlinked-file" },
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
							handlers = {
								["textDocument/publishDiagnostics"] = function() end,
							},
						})
					end,

					-- Custom Clangd
					clangd = function()
						lspconfig.clangd.setup({
							capabilities = capabilities,
						})
					end,

					-- SKIP denols and ts_ls - we handle manually
					denols = function() end,
					ts_ls = function() end,
				},
			})

			-- Manual handling for Deno vs Node. js
			vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
				pattern = { "*.js", "*. jsx", "*.ts", "*. tsx" },
				callback = function()
					local bufnr = vim.api.nvim_get_current_buf()

					-- Check if LSP already attached to this buffer
					local clients = vim.lsp.get_clients({ bufnr = bufnr })
					for _, client in ipairs(clients) do
						if client.name == "denols" or client.name == "ts_ls" then
							return
						end
					end

					-- Try to find deno. json first (DENO TAKES PRIORITY)
					local deno_root = vim.fs.root(bufnr, { "deno.json", "deno. jsonc" })
					if deno_root then
						print("Found deno.json at:  " .. deno_root .. " - Starting denols")
						vim.lsp.start({
							name = "denols",
							cmd = { "deno", "lsp" },
							root_dir = deno_root,
							capabilities = capabilities,
							settings = {
								deno = {
									enable = true,
									unstable = true,
									lint = true,
									suggest = {
										imports = {
											hosts = {
												["https://deno.land"] = true,
												["https://cdn.nest.land"] = true,
												["https://crux.land"] = true,
											},
										},
									},
								},
							},
						})
						return -- STOP HERE - don't check for Node. js
					end

					-- Only check for Node.js if NO deno.json found
					local node_root = vim.fs.root(bufnr, { "package.json" })
					if node_root then
						print("Found package.json at: " .. node_root .. " - Starting ts_ls")
						vim.lsp.start({
							name = "ts_ls",
							cmd = { "typescript-language-server", "--stdio" },
							root_dir = node_root,
							capabilities = capabilities,
							settings = {
								typescript = {
									inlayHints = {
										includeInlayParameterNameHints = "all",
										includeInlayParameterNameHintsWhenArgumentMatchesName = true,
										includeInlayFunctionParameterTypeHints = true,
										includeInlayVariableTypeHints = true,
										includeInlayVariableTypeHintsWhenTypeMatchesName = true,
										includeInlayPropertyDeclarationTypeHints = true,
										includeInlayFunctionLikeReturnTypeHints = true,
										includeInlayEnumMemberValueHints = true,
									},
								},
								javascript = {
									inlayHints = {
										includeInlayParameterNameHints = "all",
										includeInlayParameterNameHintsWhenArgumentMatchesName = true,
										includeInlayFunctionParameterTypeHints = true,
										includeInlayVariableTypeHints = true,
										includeInlayVariableTypeHintsWhenTypeMatchesName = true,
										includeInlayPropertyDeclarationTypeHints = true,
										includeInlayFunctionLikeReturnTypeHints = true,
										includeInlayEnumMemberValueHints = true,
									},
								},
							},
						})
					end
				end,
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et

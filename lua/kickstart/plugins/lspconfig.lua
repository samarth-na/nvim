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
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		-- Main LSP Configuration
		"neovim/nvim-lspconfig",
		dependencies = {
			event = "bufRead",
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
							enable = true, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
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

			-- Configure LSP servers using Neovim 0.11+ native API
			-- Deno LSP
			vim.lsp.config("denols", {
				cmd = { "deno", "lsp" },
				cmd_env = { NO_COLOR = true },
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
				},
				root_markers = { "deno.json", "deno.jsonc" },
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

			-- Auto-start denols in Deno projects
			vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
				pattern = {
					"*.js",
					"*.jsx",
					"*.ts",
					"*.tsx",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
				callback = function(args)
					-- Skip if LSP already attached
					local clients = vim.lsp.get_clients({ bufnr = args.buf })

					local root_dir = vim.fs.root(args.buf, { "deno.json", "deno.jsonc" })

					if root_dir then
						vim.lsp.start({
							name = "denols",
							cmd = { "deno", "lsp" },
							root_dir = root_dir,
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
					end
				end,
			})

			-- TypeScript/JavaScript LSP
			vim.lsp.config("ts_ls", {
				cmd = { "typescript-language-server", "--stdio" },
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
				},
				root_markers = { "package.json" },
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

			-- Auto-start ts_ls in Node projects (but NOT Deno projects)
			vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
				pattern = {
					"*.js",
					"*.jsx",
					"*.ts",
					"*.tsx",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
				callback = function(args)
					-- Skip if LSP already attached
					local clients = vim.lsp.get_clients({ bufnr = args.buf })
					for _, client in ipairs(clients) do
						if client.name == "denols" or client.name == "ts_ls" then
							return
						end
					end

					local root_dir = vim.fs.root(args.buf, { "package.json" })
					-- Only start ts_ls if we have package.json AND no deno.json
					if root_dir then
						local has_deno = vim.fs.root(args.buf, { "deno.json", "deno.jsonc" })
						if not has_deno then
							vim.lsp.start({
								name = "ts_ls",
								cmd = { "typescript-language-server", "--stdio" },
								root_dir = root_dir,
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
					end
				end,
			})

			-- Lua LSP
			vim.lsp.config("lua_ls", {
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				root_markers = {
					".luarc.json",
					".luarc.jsonc",
					".luacheckrc",
					".stylua.toml",
					"stylua.toml",
					"selene.toml",
					"selene.yml",
					".git",
				},
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

			-- Tailwind CSS LSP (autostart disabled)
			vim.lsp.config("tailwindcss", {
				cmd = { "tailwindcss-language-server", "--stdio" },
				filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
				root_markers = { "tailwind.config.js", "tailwind.config.ts" },
				capabilities = capabilities,
				autostart = false,
			})

			-- Rust Analyzer
			vim.lsp.config("rust_analyzer", {
				cmd = { "rust-analyzer" },
				filetypes = { "rust" },
				root_markers = { "Cargo.toml" },
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						diagnostics = {
							disabled = { "unlinked-file" },
						},
					},
				},
			})

			-- Python LSP (basedpyright with diagnostics disabled)
			vim.lsp.config("basedpyright", {
				cmd = { "basedpyright-langserver", "--stdio" },
				filetypes = { "python" },
				root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
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

			-- Enable LSP servers
			-- Create autocmds for automatic LSP startup
			vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
				pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
				callback = function()
					local bufnr = vim.api.nvim_get_current_buf()

					-- Check if LSP already attached to this buffer
					local clients = vim.lsp.get_clients({ bufnr = bufnr })
					for _, client in ipairs(clients) do
						if client.name == "denols" or client.name == "ts_ls" then
							return
						end
					end

					-- Try to find deno.json first
					local deno_root = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })
					if deno_root then
						vim.lsp.start({
							name = "denols",
							cmd = { "deno", "lsp" },
							root_dir = deno_root,
							capabilities = capabilities,
						})
						return
					end

					-- Otherwise try package.json for ts_ls
					local node_root = vim.fs.root(bufnr, { "package.json" })
					if node_root then
						vim.lsp.start({
							name = "ts_ls",
							cmd = { "typescript-language-server", "--stdio" },
							root_dir = node_root,
							capabilities = capabilities,
						})
					end
				end,
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
-- vim: ts=2 sts=2 sw=2 et

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
			-- TypeScript 7.0 exits with status 1 and logs "context canceled"
			-- after a clean `tsc --lsp` shutdown (microsoft/TypeScript#64276).
			-- Hide only that exact Neovim warning; other exit codes stay visible.
			local notify = vim.notify
			vim.notify = function(msg, level, opts)
				if
					level == vim.log.levels.WARN
					and type(msg) == "string"
					and msg:match("^Client tsc quit with exit code 1 and signal 0%. Check log")
				then
					return
				end
				return notify(msg, level, opts)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buf = event.buf, desc = "LSP: " .. desc })
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

					if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buf = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buf = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buf = event2.buf })
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

			-- mason-lspconfig v2 configures servers through `vim.lsp.config`; the
			-- old `handlers` table was removed. Apply the capabilities to every
			-- server config and keep per-server options as `vim.lsp.config` calls.
			vim.lsp.config("*", { capabilities = capabilities })

			require("mason").setup()

			local ensure_installed = {
				"stylua",
				"lua_ls",
				"html-lsp",
				"clang-format",
			}
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			-- Setup mason-lspconfig for auto-installing and setting up servers.
			-- tailwindcss is started manually, and ts_ls is excluded so it never
			-- fights with the TypeScript server enabled below.
			require("mason-lspconfig").setup({
				automatic_enable = {
					exclude = { "tailwindcss", "ts_ls" },
				},
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"basedpyright",
					"clangd",
					"tailwindcss",
					"tsc",
				},
			})

			-- Custom Lua LSP
			vim.lsp.config("lua_ls", {
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

			-- Custom Rust Analyzer
			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						diagnostics = {
							disabled = { "unlinked-file" },
						},
					},
				},
			})

			-- Custom Python LSP
			vim.lsp.config("basedpyright", {
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

			-- TypeScript language server. `tsc` is the official TypeScript 7+
			-- language server; the older `tsgo` server is deprecated in favor of
			-- it. The binary is installed by mason (see `ensure_installed` above)
			-- and resolved by nvim-lspconfig.
			vim.lsp.enable("tsc")
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et

local function toggle_ai()
	local sm_ok, sm = pcall(require, "supermaven-nvim")
	local sm_running = sm_ok and sm.is_enabled()

	if sm_running then
		vim.cmd("SupermavenStop")
		vim.cmd("Codeium Enable")
		vim.notify("Switched to Codeium", vim.log.levels.INFO)
	else
		vim.cmd("Codeium Disable")
		vim.cmd("SupermavenStart")
		vim.notify("Switched to Supermaven", vim.log.levels.INFO)
	end
end

vim.keymap.set("n", "<leader>at", toggle_ai, { desc = "Toggle AI completion (Supermaven/Codeium)" })

return {
	{
		"supermaven-inc/supermaven-nvim",
		event = "InsertEnter",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<c-j>",
					clear_suggestion = "<C-x>",
					accept_word = "<C-f>",
				},
				ignore_filetypes = { cpp = false, copilotchat = true, markdown = true },
				color = {
					suggestion_color = "#ffffff",
				},
				disable_inline_completion = false,
				disable_keymaps = false,
			})
		end,
	},

	{
		"exafunction/codeium.vim",
		event = "InsertEnter",
		init = function()
			vim.g.codeium_enabled = false
		end,
		config = function()
			vim.keymap.set("i", "<C-f>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<c-D>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<c-d>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<c-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true, silent = true })
		end,
	},

	{
		"sudo-tee/opencode.nvim",
		cmd = "Opencode",
		config = function()
			require("opencode").setup({
				ui = {
					position = "float",
					input_position = "bottom",
					float = {
						width = 0.95,
						height = 0.9,
						border = "rounded",
						gap = 1,
						zindex = 40,
					},
				},
			})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/snacks.nvim",
		},
	},
}
-- vim: ts=4 sts=4 sw=4 et

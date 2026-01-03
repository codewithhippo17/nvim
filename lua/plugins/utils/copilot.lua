-- GitHub Copilot Configuration
-- Using copilot.lua for better integration with modern Neovim

return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter", 
		dependencies = {
			"zbirenbaum/copilot-cmp",
		},
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<A-CR>"
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<A-a>",
						accept_word = "<A-w>",
						accept_line = "<A-l>",
						next = "<A-j>",
						prev = "<A-k>",
						dismiss = "<A-d>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
					-- Enable for programming languages
					lua = true,
					javascript = true,
					typescript = true,
					python = true,
					rust = true,
					go = true,
					java = true,
					c = true,
					cpp = true,
					css = true,
					html = true,
					json = true,
				},
				copilot_node_command = "/goinfre/ehamza-backup/node-22/bin/node",
				server_opts_overrides = {},
			})
			
			-- Additional keymaps for convenience
			vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Enable Copilot" })
			vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Disable Copilot" })
			vim.keymap.set("n", "<leader>cs", ":Copilot status<CR>", { desc = "Copilot status" })
			vim.keymap.set("n", "<leader>ca", ":Copilot auth<CR>", { desc = "Copilot auth" })
			vim.keymap.set("n", "<leader>cp", ":Copilot panel<CR>", { desc = "Copilot panel" })
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function ()
			require("copilot_cmp").setup()
		end
	},
}
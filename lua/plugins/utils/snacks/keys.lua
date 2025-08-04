local keys = {
	-- Top Pickers & Explorer (optimized for home row)
	{
		"<leader>f",
		function()
			Snacks.picker.smart()
		end,
		desc = "Smart Find Files",
	},
	{
		"<leader>b",
		function()
			Snacks.picker.buffers()
		end,
		desc = "Buffers",
	},
	{
		"<leader>g",
		function()
			Snacks.picker.grep()
		end,
		desc = "Live Grep",
	},
	{
		"<leader>h",
		function()
			Snacks.picker.command_history()
		end,
		desc = "Command History",
	},
	{
		"<leader>e",
		function()
			Snacks.explorer()
		end,
		desc = "File Explorer",
	},
	-- Find (optimized shortcuts)
	{
		"<leader>ff",
		function()
			Snacks.picker.files()
		end,
		desc = "Find Files",
	},
	{
		"<leader>fr",
		function()
			Snacks.picker.recent()
		end,
		desc = "Recent Files",
	},
	{
		"<leader>fc",
		function()
			Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
		end,
		desc = "Find Config File",
	},
	{
		"<leader>fg",
		function()
			Snacks.picker.git_files()
		end,
		desc = "Find Git Files",
	},
	-- Git (home row optimized)
	{
		"<leader>gb",
		function()
			Snacks.picker.git_branches()
		end,
		desc = "Git Branches",
	},
	{
		"<leader>gl",
		function()
			Snacks.picker.git_log()
		end,
		desc = "Git Log",
	},
	{
		"<leader>gs",
		function()
			Snacks.picker.git_status()
		end,
		desc = "Git Status",
	},
	{
		"<leader>gd",
		function()
			Snacks.picker.git_diff()
		end,
		desc = "Git Diff (Hunks)",
	},
	{
		"<leader>gf",
		function()
			Snacks.picker.git_log_file()
		end,
		desc = "Git Log File",
	},
	-- Search (simplified and ergonomic)
	{
		"<leader>sw",
		function()
			Snacks.picker.grep_word()
		end,
		desc = "Search Word Under Cursor",
		mode = { "n", "x" },
	},
	{
		"<leader>sl",
		function()
			Snacks.picker.lines()
		end,
		desc = "Search Buffer Lines",
	},
	{
		"<leader>sh",
		function()
			Snacks.picker.help()
		end,
		desc = "Help Pages",
	},
	{
		"<leader>sk",
		function()
			Snacks.picker.keymaps()
		end,
		desc = "Keymaps",
	},
	{
		"<leader>sd",
		function()
			Snacks.picker.diagnostics()
		end,
		desc = "Diagnostics",
	},
	{
		"<leader>sr",
		function()
			Snacks.picker.resume()
		end,
		desc = "Resume Last Search",
	},
	-- LSP & Core Functions (ergonomic)
	{
		"<leader>ls",
		function()
			Snacks.picker.lsp_symbols()
		end,
		desc = "LSP Document Symbols",
	},
	{
		"<leader>lw",
		function()
			Snacks.picker.lsp_workspace_symbols()
		end,
		desc = "LSP Workspace Symbols",
	},
	-- Utility Functions
	{
		"<leader>z",
		function()
			Snacks.zen()
		end,
		desc = "Toggle Zen Mode",
	},
	{
		"<leader>n",
		function()
			Snacks.notifier.show_history()
		end,
		desc = "Notification History",
	},
	{
		"<leader>x",
		function()
			Snacks.bufdelete()
		end,
		desc = "Delete Buffer",
	},
	{
		"<leader>r",
		function()
			Snacks.rename.rename_file()
		end,
		desc = "Rename File",
	},
	{
		"<leader>gg",
		function()
			Snacks.lazygit()
		end,
		desc = "Lazygit",
	},
	-- Terminal (ergonomic keys)
	{
		"<leader>t",
		function()
			Snacks.terminal()
		end,
		desc = "Toggle Terminal",
	},
	-- Keymap Cheatsheet
	{
		"<leader>?",
		function()
			local lines = {
				"# 🚀 Neovim Keymap Cheatsheet",
				"",
				"## 📁 Core Navigation",
				"| Key | Action |",
				"|-----|--------|",
				"| <leader>f | Smart Find Files |",
				"| <leader>b | Buffers |",
				"| <leader>g | Live Grep |",
				"| <leader>e | File Explorer |",
				"| <leader>t | Toggle Terminal |",
				"| <Tab> / <S-Tab> | Next/Previous Buffer |",
				"| <leader>c | Close Buffer |",
				"| <leader>x | Delete Buffer |",
				"",
				"## 🔍 Find & Search",
				"| Key | Action |",
				"|-----|--------|",
				"| <leader>ff | Find Files |",
				"| <leader>fr | Recent Files |",
				"| <leader>fc | Find Config Files |",
				"| <leader>fg | Find Git Files |",
				"| <leader>sw | Search Word Under Cursor |",
				"| <leader>sl | Search Buffer Lines |",
				"| <leader>sh | Help Pages |",
				"| <leader>sk | Keymaps |",
				"| <leader>sd | Diagnostics |",
				"| <leader>sr | Resume Last Search |",
				"| <leader>sf | Find & Replace (Spectre) |",
				"",
				"## 🌿 Git Operations",
				"| Key | Action |",
				"|-----|--------|",
				"| <leader>gg | Lazygit |",
				"| <leader>gb | Git Branches / Git Blame |",
				"| <leader>gl | Git Log |",
				"| <leader>gs | Git Status |",
				"| <leader>gd | Git Diff (Hunks) |",
				"| <leader>gf | Git Log File |",
				"",
				"## 🔧 LSP & Code",
				"| Key | Action |",
				"|-----|--------|",
				"| gd | Go to Definition |",
				"| gr | Go to References |",
				"| gi | Go to Implementation |",
				"| gt | Go to Type Definition |",
				"| K | Hover Documentation |",
				"| <leader>rn | Rename Symbol |",
				"| <leader>ca | Code Action |",
				"| <leader>ls | LSP Document Symbols |",
				"| <leader>lw | LSP Workspace Symbols |",
				"",
				"## ⚡ Diagnostics",
				"| Key | Action |",
				"|-----|--------|",
				"| <leader>j | Next Diagnostic |",
				"| <leader>k | Previous Diagnostic |",
				"| <leader>d | Show Diagnostic |",
				"| <leader>q | Diagnostic Quickfix |",
				"",
				"## 🤖 Copilot (Insert Mode)",
				"| Key | Action |",
				"|-----|--------|",
				"| <A-a> | Accept Suggestion |",
				"| <A-w> | Accept Word |",
				"| <A-j> | Next Suggestion |",
				"| <A-k> | Previous Suggestion |",
				"",
				"## 🪟 Window Navigation",
				"| Key | Action |",
				"|-----|--------|",
				"| <C-h> | Focus Left Window |",
				"| <C-l> | Focus Right Window |",
				"| <C-k> | Focus Upper Window |",
				"| <C-j> | Focus Lower Window |",
				"",
				"## 🎯 Utilities",
				"| Key | Action |",
				"|-----|--------|",
				"| <leader>z | Toggle Zen Mode |",
				"| <leader>n | Notification History |",
				"| <leader>r | Rename File |",
				"| <leader>h | Command History |",
				"| ]] / [[ | Next/Previous Reference |",
				"",
				"## 🌟 Special Keys",
				"| Key | Action |",
				"|-----|--------|",
				"| <Esc> | Clear Search Highlight |",
				"| <Esc><Esc> | Exit Terminal Mode |",
				"| gc | Comment Lines (Visual) |",
				"",
				"Press 'q' or <Esc> to close this cheatsheet",
			}
			
			-- Create a buffer with the content
			local buf = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
			vim.bo[buf].filetype = "markdown"
			vim.bo[buf].modifiable = false
			
			-- Open in a floating window
			Snacks.win({
				buf = buf,
				width = 0.8,
				height = 0.9,
				wo = {
					wrap = false,
					signcolumn = "no",
					number = false,
					relativenumber = false,
				},
				keys = {
					q = "close",
					["<Esc>"] = "close",
				},
			})
		end,
		desc = "Keymap Cheatsheet",
	},
	-- All Keymaps (including built-in Vim)
	{
		"<leader>K",
		function()
			Snacks.picker.keymaps()
		end,
		desc = "All Keymaps (Searchable)",
	},
	-- Word navigation (keep existing)
	{
		"]]",
		function()
			Snacks.words.jump(vim.v.count1)
		end,
		desc = "Next Reference",
		mode = { "n", "t" },
	},
	{
		"[[",
		function()
			Snacks.words.jump(-vim.v.count1)
		end,
		desc = "Prev Reference",
		mode = { "n", "t" },
	},
}

return keys

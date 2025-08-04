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
				"",
				"                      ╭──────────────────────────────────────╮",
				"                      │    🚀 NEOVIM KEYMAP CHEATSHEET 🚀   │",
				"                      ╰──────────────────────────────────────╯",
				"",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                              📁 CORE NAVIGATION                             │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <leader>f  Smart Find Files      <leader>e  ·········· File Explorer      ",
				"│   <leader>b  Buffers               <leader>t  ·········· Terminal           │",
				"│   <leader>g  Live Grep             <A-e>      ·········· Float Terminal     │",
				"│   <S-h/l>    Prev/Next Buffer      <leader>x  ·········· Delete Buffer      │",
				"│   <S-j/k>    Move Buffer Up/Down   <Tab/S-Tab>           Next/Prev Tab      │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                              🔍 FIND & SEARCH                               │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <leader>ff ·········· Find Files            <leader>sw ·········· Search Word    │",
				"│   <leader>fr ·········· Recent Files          <leader>sl Search Lines   │",
				"│   <leader>fc ·········· Find Config Files     <leader>sh Help Pages     │",
				"│   <leader>fg ·········· Find Git Files        <leader>sk Keymaps │",
				"│   <leader>sd ·········· Diagnostics           <leader>sr Resume Search  │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                              🌿 GIT OPERATIONS                              │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <leader>gg ·········· Lazygit               <leader>gs ·········· Git Status     │",
				"│   <leader>gb ·········· Git Branches          <leader>gd ·········· Git Diff       │",
				"│   <leader>gl ·········· Git Log               <leader>gf ·········· Git Log File   │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                           🔧 LSP & CODE NAVIGATION                          │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   gd         ·········· Go to Definition      <leader>rn ·········· Rename Symbol  │",
				"│   gr         ·········· Go to References      <leader>ca ·········· Code Action    │",
				"│   gi         ·········· Go to Implementation  K         ·········· Hover Docs     │",
				"│   gy         ·········· Go to Type Definition <leader>ls ·········· Doc Symbols    │",
				"│   <leader>lw ·········· Workspace Symbols     ]] / [[   ·········· Next/Prev Ref  │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                            ⚡ DIAGNOSTICS & ERRORS                          │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <leader>j  ·········· Next Diagnostic       <leader>dd ·········· Show Diagnostic │",
				"│   <leader>k  ·········· Previous Diagnostic   <leader>q  ·········· Quickfix List  │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                             🪟 WINDOW MANAGEMENT                            │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <C-h/l>    ·········· Focus Left/Right      <C-A-h/l>  ·········· Resize Width   │",
				"│   <C-j/k>    ·········· Focus Up/Down         <C-A-j/k>  ·········· Resize Height  │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                            🎯 UTILITIES & SPECIAL                           │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <leader>z  ·········· Toggle Zen Mode       <leader>r  ·········· Rename File    │",
				"│   <leader>n  ·········· Notification History  <leader>h  ·········· Command History │",
				"│   <leader>?  ·········· This Cheatsheet       <leader>K  ·········· All Keymaps    │",
				"│   <Esc>      ·········· Clear Search          gc        ·········· Comment Lines  │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"",
				"                       ╭────────────────────────────────╮",
				"                       │   Press 'q' or <Esc> to close │",
				"                       ╰────────────────────────────────╯",
				"",
			}

			-- Create a buffer with the content
			local buf = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
			vim.bo[buf].filetype = "text"
			vim.bo[buf].modifiable = false

			-- Define highlight groups for better visuals
			local ns = vim.api.nvim_create_namespace("cheatsheet")

			-- Apply highlights after buffer is created
			vim.schedule(function()
				-- Title highlights
				vim.api.nvim_buf_add_highlight(buf, ns, "Title", 2, 22, 60)

				-- Section headers
				local section_lines = { 7, 19, 30, 39, 49, 57, 65 }
				for _, line in ipairs(section_lines) do
					vim.api.nvim_buf_add_highlight(buf, ns, "Function", line, 0, -1)
				end

				-- Key bindings highlighting
				for i = 0, vim.api.nvim_buf_line_count(buf) - 1 do
					local line_text = vim.api.nvim_buf_get_lines(buf, i, i + 1, false)[1] or ""

					-- Highlight key bindings (left side)
					local key_pattern = "│   ([^·]+)··"
					local key_match = line_text:match(key_pattern)
					if key_match then
						local key_start = line_text:find(key_match, 5)
						if key_start then
							vim.api.nvim_buf_add_highlight(
								buf,
								ns,
								"Keyword",
								i,
								key_start - 1,
								key_start + #key_match - 1
							)
						end
					end

					-- Highlight key bindings (right side)
					local right_key_start = line_text:find("<[^>]*>", 40)
					if right_key_start then
						local right_key_end = line_text:find(">", right_key_start) + 1
						vim.api.nvim_buf_add_highlight(buf, ns, "Keyword", i, right_key_start - 1, right_key_end - 1)
					end

					-- Highlight leader key specifically
					for leader_match in line_text:gmatch("<leader>") do
						local leader_start = line_text:find("<leader>", 1)
						while leader_start do
							vim.api.nvim_buf_add_highlight(buf, ns, "Special", i, leader_start - 1, leader_start + 7)
							leader_start = line_text:find("<leader>", leader_start + 1)
						end
					end

					-- Highlight dotted separators
					for dot_start, dot_end in line_text:gmatch("()··········()") do
						vim.api.nvim_buf_add_highlight(buf, ns, "Comment", i, dot_start - 1, dot_end - 1)
					end
				end

				-- Border highlights
				for i = 0, vim.api.nvim_buf_line_count(buf) - 1 do
					local line_text = vim.api.nvim_buf_get_lines(buf, i, i + 1, false)[1] or ""
					-- Main borders
					if line_text:match("^╭") or line_text:match("^├") or line_text:match("^╰") then
						vim.api.nvim_buf_add_highlight(buf, ns, "FloatBorder", i, 0, -1)
					end
					-- Title borders
					if
						line_text:match("^                      ╭") or line_text:match("^                      ╰")
					then
						vim.api.nvim_buf_add_highlight(buf, ns, "Title", i, 0, -1)
					end
					-- Footer borders
					if
						line_text:match("^                       ╭") or line_text:match("^                       ╰")
					then
						vim.api.nvim_buf_add_highlight(buf, ns, "WarningMsg", i, 0, -1)
					end
				end
			end)

			-- Open in a centered floating window
			Snacks.win({
				buf = buf,
				width = 0.85,
				height = 0.92,
				border = "rounded",
				title = " Keymap Cheatsheet ",
				title_pos = "center",
				wo = {
					wrap = false,
					signcolumn = "no",
					number = false,
					relativenumber = false,
					cursorline = false,
					colorcolumn = "",
				},
				keys = {
					q = "close",
					["<Esc>"] = "close",
					["<C-c>"] = "close",
				},
			})
		end,
		desc = "Enhanced Keymap Cheatsheet",
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

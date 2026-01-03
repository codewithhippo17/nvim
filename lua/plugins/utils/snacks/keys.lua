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
		"<leader> ",
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
	
	-- 🔍 DIAGNOSTICS & ERROR MANAGEMENT (Consolidated under <leader>d)
	{
		"<leader>dd",
		function()
			Snacks.picker.diagnostics()
		end,
		desc = "📋 All Diagnostics",
	},
	{
		"<leader>df", 
		function()
			vim.diagnostic.open_float()
		end,
		desc = "📋 Show Diagnostic Float",
	},
	{
		"<leader>dq",
		function()
			vim.diagnostic.setloclist()
		end,
		desc = "📋 Diagnostic Quickfix",
	},
	{
		"<leader>dm", -- Move last error message here
		function()
			-- Show last error message
			local last_error = vim.v.errmsg
			if last_error and last_error ~= "" then
				vim.notify("Last Error: " .. last_error, vim.log.levels.ERROR)
			else
				vim.notify("No recent error messages", vim.log.levels.INFO)
			end
		end,
		desc = "📋 Last Error Message",
	},
	{
		"<leader>dw", -- Move window diagnostics here
		function()
			-- Diagnostic function for window debugging
			local current_win = vim.api.nvim_get_current_win()
			local buf = vim.api.nvim_get_current_buf()
			local win_config = vim.api.nvim_win_get_config(current_win)
			local win_valid = vim.api.nvim_win_is_valid(current_win)
			local buf_valid = vim.api.nvim_buf_is_valid(buf)
			
			local info = {
				"Window Diagnostics:",
				"==================",
				"Current Window: " .. current_win,
				"Window Valid: " .. tostring(win_valid),
				"Current Buffer: " .. buf,
				"Buffer Valid: " .. tostring(buf_valid),
				"Window Relative: " .. (win_config.relative or "none"),
				"Window Type: " .. (win_config.relative == "" and "normal" or "floating"),
				"Total Windows: " .. vim.fn.winnr('$'),
				"Total Buffers: " .. #vim.fn.getbufinfo({buflisted = 1}),
			}
			
			vim.notify(table.concat(info, "\n"), vim.log.levels.INFO)
		end,
		desc = "🪟 Window State Diagnostics",
	},
	
	-- Error & Message Viewing (keep separate from diagnostics)
	{
		"<leader>m",
		function()
			vim.cmd("messages")
		end,
		desc = "📜 View All Messages/Errors",
	},
	{
		"<leader>M",
		function()
			-- Enhanced messages viewer with better formatting
			local messages = vim.fn.execute("messages")
			local lines = vim.split(messages, "\n")
			
			-- Create buffer with messages
			local buf = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
			vim.bo[buf].filetype = "messages"
			vim.bo[buf].modifiable = false
			
			-- Open in floating window
			Snacks.win({
				buf = buf,
				width = 0.9,
				height = 0.7,
				border = "rounded",
				title = " 📜 Vim Messages & Errors ",
				title_pos = "center",
				wo = {
					wrap = true,
					signcolumn = "no",
					number = true,
					relativenumber = false,
				},
				keys = {
					q = "close",
					["<Esc>"] = "close",
					["<C-c>"] = "close",
				},
			})
		end,
		desc = "📜 Enhanced Messages Viewer",
	},
	{
		"<leader>M",
		function()
			-- Enhanced messages viewer with better formatting
			local messages = vim.fn.execute("messages")
			local lines = vim.split(messages, "\n")
			
			-- Create buffer with messages
			local buf = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
			vim.bo[buf].filetype = "messages"
			vim.bo[buf].modifiable = false
			
			-- Open in floating window
			Snacks.win({
				buf = buf,
				width = 0.9,
				height = 0.7,
				border = "rounded",
				title = " 📜 Vim Messages & Errors ",
				title_pos = "center",
				wo = {
					wrap = true,
					signcolumn = "no",
					number = true,
					relativenumber = false,
				},
				keys = {
					q = "close",
					["<Esc>"] = "close",
					["<C-c>"] = "close",
				},
			})
		end,
		desc = "📜 Enhanced Messages Viewer",
	},
	{
		"<leader>em", 
		function()
			-- Show last error message
			local last_error = vim.v.errmsg
			if last_error and last_error ~= "" then
				vim.notify("Last Error: " .. last_error, vim.log.levels.ERROR)
			else
				vim.notify("No recent error messages", vim.log.levels.INFO)
			end
		end,
		desc = "🚨 Show Last Error",
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
		"<leader>sM",
		function()
			-- Comprehensive manual browser with MinilibX support
			Snacks.terminal({
				"bash", "-c", 
				'{ /usr/bin/man -k . 2>/dev/null; find /usr/include/minilibx-linux/man -name "*.3" 2>/dev/null | while read f; do n=$(basename "$f" .3); echo "$n (3) - MinilibX function"; done; } | sort | uniq | /home/ehamza/.fzf/bin/fzf --prompt="All Manuals> " | { read sel; if [ ! -z "$sel" ]; then page=$(echo "$sel" | /usr/bin/awk "{print \\$1}"); /usr/bin/man "$page" 2>/dev/null || /usr/bin/man -M /usr/include/minilibx-linux/man "$page"; fi; }'
			}, {
				win = {
					position = "float",
					height = 0.9,
					width = 0.9,
				}
			})
		end,
		desc = "All Manuals",
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

	{
		"<leader>ds",
		function()
			Snacks.picker.lsp_symbols()
		end,
		desc = "📋 Document Symbols",
	},
	{
		"<leader>lw",
		function()
			Snacks.picker.lsp_workspace_symbols()
		end,
		desc = "LSP Workspace Symbols",
	},
	{
		"gm",
		function()
			-- Go to man page for word under cursor
			local word = vim.fn.expand("<cword>")
			if word and word ~= "" then
				-- Try to open man page for the word under cursor
				Snacks.terminal({
					"bash", "-c", 
					string.format('if /usr/bin/man "%s" >/dev/null 2>&1; then /usr/bin/man "%s"; elif /usr/bin/man -M /usr/include/minilibx-linux/man "%s" >/dev/null 2>&1; then /usr/bin/man -M /usr/include/minilibx-linux/man "%s"; else echo "No manual found for: %s"; echo "Press Enter to continue..."; read; fi', word, word, word, word, word)
				}, {
					win = {
						position = "float",
						height = 0.9,
						width = 0.9,
					}
				})
			else
				print("No word under cursor")
			end
		end,
		desc = "Go to Manual (word under cursor)",
	},
	
	-- 🚀 GO DEBUGGING (Moved to <leader>D to avoid conflicts)
	{
		"<leader>Db",
		"<cmd>DapToggleBreakpoint<CR>",
		desc = "Debug: Toggle Breakpoint",
		ft = { "go" },
	},
	{
		"<leader>Dc",
		"<cmd>DapContinue<CR>",
		desc = "Debug: Continue",
		ft = { "go" },
	},
	{
		"<leader>Di",
		"<cmd>DapStepInto<CR>",
		desc = "Debug: Step Into",
		ft = { "go" },
	},
	{
		"<leader>Do",
		"<cmd>DapStepOver<CR>",
		desc = "Debug: Step Over", 
		ft = { "go" },
	},
	{
		"<leader>DO",
		"<cmd>DapStepOut<CR>",
		desc = "Debug: Step Out",
		ft = { "go" },
	},
	{
		"<leader>Dr",
		"<cmd>DapRepl<CR>",
		desc = "Debug: Open REPL",
		ft = { "go" },
	},
	{
		"<leader>Dus",
		function()
			local widgets = require("dap.ui.widgets")
			local sidebar = widgets.sidebar(widgets.scopes)
			sidebar.open()
		end,
		desc = "Debug: Open Sidebar",
		ft = { "go" },
	},
	{
		"<leader>Dgt",
		function()
			require("dap-go").debug_test()
		end,
		desc = "Debug: Go Test",
		ft = { "go" },
	},
	{
		"<leader>Dgl",
		function()
			require("dap-go").debug_last()
		end,
		desc = "Debug: Go Last Test",
		ft = { "go" },
	},
	{
		"<leader>gsj",
		"<cmd>GoTagAdd json<CR>",
		desc = "Go: Add JSON tags",
		ft = { "go" },
	},
	{
		"<leader>gsy",
		"<cmd>GoTagAdd yaml<CR>",
		desc = "Go: Add YAML tags", 
		ft = { "go" },
	},
	{
		"<leader>gst",
		"<cmd>GoTagRm<CR>",
		desc = "Go: Remove tags",
		ft = { "go" },
	},
	{
		"<leader>gie",
		"<cmd>GoIfErr<CR>",
		desc = "Go: Add if err",
		ft = { "go" },
	},
	{
		"<leader>gtj",
		"<cmd>GoTestAdd<CR>",
		desc = "Go: Add test for func",
		ft = { "go" },
	},
	{
		"<leader>gta",
		"<cmd>GoTestsAll<CR>",
		desc = "Go: Add all tests",
		ft = { "go" },
	},
	{
		"<leader>gtf",
		"<cmd>GoTestsExp<CR>",
		desc = "Go: Add exported tests",
		ft = { "go" },
	},
	{
		"<leader>gcf",
		"<cmd>GoCmt<CR>",
		desc = "Go: Generate comment",
		ft = { "go" },
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
	
	-- Navigation & Buffer Management
	{
		"<leader>0", -- Home row key for quick access
		function()
			-- Close all buffers and return to dashboard
			vim.cmd("silent! %bdelete!")
			Snacks.dashboard()
		end,
		desc = "🏠 Return to Dashboard (Close All)",
	},
	{
		"<leader>bd",
		function()
			-- Close all buffers except current
			vim.cmd("silent! %bdelete|edit#|bdelete#")
		end,
		desc = "Close All Buffers (Keep Current)",
	},
	{
		"<leader>bD",
		function()
			-- Force close all buffers
			vim.cmd("silent! bufdo bdelete!")
			vim.cmd("enew") -- Create new empty buffer
		end,
		desc = "Force Close All Buffers",
	},
	{
		"<leader>x",
		function()
			Snacks.bufdelete()
		end,
		desc = "Delete Buffer",
	},
	
	-- Project Directory Navigation (Single FZF Picker)
	{
		"<leader>p",
		function()
			-- Create list of project directories to search
			local project_roots = {
				vim.fn.expand("~/dev"),
				vim.fn.expand("~/.config"),
			}
			
			-- Function to get all directories recursively (max depth 3)
			local function get_directories(path, depth, max_depth)
				depth = depth or 1
				max_depth = max_depth or 3
				local dirs = {}
				
				if depth > max_depth then
					return dirs
				end
				
				local handle = vim.loop.fs_scandir(path)
				if handle then
					local name, type = vim.loop.fs_scandir_next(handle)
					while name do
						if type == "directory" and not name:match("^%.") then
							local full_path = path .. "/" .. name
							table.insert(dirs, full_path)
							-- Recursively get subdirectories
							if depth < max_depth then
								local subdirs = get_directories(full_path, depth + 1, max_depth)
								for _, subdir in ipairs(subdirs) do
									table.insert(dirs, subdir)
								end
							end
						end
						name, type = vim.loop.fs_scandir_next(handle)
					end
				end
				
				return dirs
			end
			
			-- Collect all project directories
			local all_dirs = {}
			for _, root in ipairs(project_roots) do
				if vim.loop.fs_stat(root) then
					table.insert(all_dirs, root) -- Include root itself
					local subdirs = get_directories(root)
					for _, dir in ipairs(subdirs) do
						table.insert(all_dirs, dir)
					end
				end
			end
			
			-- Format directories for display
			local formatted_dirs = {}
			for _, dir in ipairs(all_dirs) do
				local display_name = dir:gsub(vim.fn.expand("~"), "~")
				local basename = vim.fn.fnamemodify(dir, ":t")
				local parent = vim.fn.fnamemodify(dir, ":h:t")
				
				-- Create a nice display format: "basename (parent/path)"
				local display = string.format("%-20s %s", basename, display_name)
				table.insert(formatted_dirs, {
					display = display,
					path = dir,
					basename = basename
				})
			end
			
			-- Sort by basename for easier searching
			table.sort(formatted_dirs, function(a, b)
				return a.basename:lower() < b.basename:lower()
			end)
			
			-- Use fzf-lua for directory selection
			require("fzf-lua").fzf_exec(
				vim.tbl_map(function(item) return item.display end, formatted_dirs),
				{
					prompt = "Project Directory❯ ",
					preview = function(selected)
						-- Find the corresponding directory
						for _, item in ipairs(formatted_dirs) do
							if item.display == selected[1] then
								return vim.fn.system("ls -la " .. vim.fn.shellescape(item.path))
							end
						end
						return "Directory not found"
					end,
					actions = {
						["default"] = function(selected)
							-- Find the corresponding directory
							for _, item in ipairs(formatted_dirs) do
								if item.display == selected[1] then
									vim.cmd("cd " .. item.path)
									Snacks.explorer()
									vim.notify("📁 Switched to: " .. item.basename, vim.log.levels.INFO)
									break
								end
							end
						end,
					},
				}
			)
		end,
		desc = "📁 FZF Project Directory Picker",
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
				"                      │    🚀 NEOVIM KEYMAP CHEATSHEET       │",
				"                      ╰──────────────────────────────────────╯",
				"",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                              📁 CORE NAVIGATION                             │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <leader>f  Smart Find Files      <leader>e  ·········· File Explorer      │",
				"│   <leader>b  Buffers               <leader>t  ·········· Terminal           │",
				"│   <leader>   Live Grep             <leader>0  ·········· Return to Dashboard │",
				"│   <S-h/l>    Prev/Next Buffer      <leader>x  ·········· Delete Buffer      │",
				"│   <S-j/k>    Move Buffer Up/Down   <leader>bd ·········· Close All Buffers  │",
				"│   <leader>bD Force Close All       <Esc>      ·········· Clear Search       │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                              🚀 PROJECT NAVIGATION                          │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <leader>p  ·········· FZF Project Directory Picker                        │",
				"│                         (Searches ~/dev and ~/.config recursively)         │",
				"│                         - Shows directories only, not files                 │",
				"│                         - Changes working directory automatically           │",
				"│                         - Opens file explorer after selection              │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                              🔍 FIND & SEARCH                               │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <leader>ff ·········· Find Files            <leader>sw Search Word        │",
				"│   <leader>fr ·········· Recent Files          <leader>sl Search Lines       │",
				"│   <leader>fc ·········· Find Config Files     <leader>sh Help Pages         │",
				"│   <leader>fg ·········· Find Git Files        <leader>sM All Manuals        │",
				"│   <leader>sd ·········· Diagnostics           <leader>sk Keymaps            │",
				"│   <leader>sr ·········· Resume Search         <leader>sf Find & Replace     │",
				"│   <leader>h  ·········· Command History       <leader>m  Messages/Errors    │",
				"│   <leader>M  ·········· Enhanced Messages     <leader>em Last Error         │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                              🌿 GIT OPERATIONS                              │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <leader>gg ·········· Lazygit               <leader>gs ··· Git Status     │",
				"│   <leader>gb ·········· Git Branches          <leader>gd ··· Git Diff       │",
				"│   <leader>gl ·········· Git Log               <leader>gf ··· Git Log File   │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                           🔧 LSP & CODE NAVIGATION                          │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   gd         ·········· Go to Definition      <leader>rn     Rename Symbol  │",
				"│   gr         ·········· Go to References      <leader>ca     Code Action    │",
				"│   gi         ·········· Go to Implementation  K              Hover Docs     │",
				"│   gy         ·········· Go to Type Definition gm             Go to Manual    │",
				"│   gD         ·········· Go to Declaration     <leader>ds     Doc Symbols    │",
				"│   <leader>ls ·········· Doc Symbols           <leader>lw     Workspace Sym   │",
				"│   <leader>ws ·········· Workspace Symbols     ]] / [[        Next/Prev Ref   │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                              ⚡ DIAGNOSTICS & DEBUGGING                      │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <leader>j  ········· Next Diagnostic       <leader>dd ··· All Diagnostics │",
				"│   <leader>k  ········· Previous Diagnostic   <leader>df ··· Float Diagnostic│",
				"│   <leader>dq ········· Diagnostic Quickfix   <leader>dm ··· Last Error Msg  │",
				"│   <leader>dw ········· Window Diagnostics    <leader>ds ··· Document Symbols│",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                             🚀 GO DEBUGGING (<leader>D)                     │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <leader>Db ·········· Debug Breakpoint      <leader>gsj ·· Add JSON Tags   │",
				"│   <leader>Dc ·········· Debug Continue        <leader>gsy ·· Add YAML Tags   │",
				"│   <leader>Di ·········· Debug Step Into       <leader>gst ·· Remove Tags     │",
				"│   <leader>Do ·········· Debug Step Over       <leader>gie ·· Add if err      │",
				"│   <leader>DO ·········· Debug Step Out        <leader>gtj ·· Add Test        │",
				"│   <leader>Dr ·········· Debug REPL            <leader>gta ·· Add All Tests   │",
				"│   <leader>Dus ········· Debug Open Sidebar    <leader>gtf ·· Add Export Tests│",
				"│   <leader>Dgt ········· Debug Go Test         <leader>gcf ·· Generate Comment│",
				"│   <leader>Dgl ········· Debug Last Test       <leader>gD  ·· Go Doc (word)   │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                            🪟 WINDOW MANAGEMENT                            │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <C-h/l>    ·········· Focus Left/Right      <C-A-h/l>      Resize Width   │",
				"│   <C-j/k>    ·········· Focus Up/Down         <C-A-j/k>      Resize Height  │",
				"│   <Esc><Esc> ·········· Exit Terminal Mode                                  │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                             🪟 WINDOW MANAGEMENT                            │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <C-h/l>    ·········· Focus Left/Right      <C-A-h/l>      Resize Width   │",
				"│   <C-j/k>    ·········· Focus Up/Down         <C-A-j/k>      Resize Height  │",
				"│   <Esc><Esc> ·········· Exit Terminal Mode                                  │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                             🚀 GO DEVELOPMENT                               │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <leader>db ·········· Debug Breakpoint      <leader>gsj ·· Add JSON Tags   │",
				"│   <leader>dc ·········· Debug Continue        <leader>gsy ·· Add YAML Tags   │",
				"│   <leader>di ·········· Debug Step Into       <leader>gst ·· Remove Tags     │",
				"│   <leader>do ·········· Debug Step Over       <leader>gie ·· Add if err      │",
				"│   <leader>dO ·········· Debug Step Out        <leader>gtj ·· Add Test        │",
				"│   <leader>dr ·········· Debug REPL            <leader>gta ·· Add All Tests   │",
				"│   <leader>dus ········· Debug Open Sidebar    <leader>gtf ·· Add Export Tests│",
				"│   <leader>dgt ········· Debug Go Test         <leader>gcf ·· Generate Comment│",
				"│   <leader>dgl ········· Debug Last Test       <leader>gD  ·· Go Doc (word)   │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                            💻 AI & COPILOT (Insert Mode)                   │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <A-a>      ·········· Accept Copilot        <leader>ot ··· Toggle OpenCode│",
				"│   <A-w>      ·········· Accept Word           <leader>oa ··· Ask OpenCode   │",
				"│   <A-j/k>    ·········· Next/Prev Suggestion  <leader>op ··· Select Prompt  │",
				"│                           OpenCode:            <leader>on ··· New Session   │",
				"│   <leader>oy ·········· Copy Last Message     <S-C-u/d> ··· Scroll Messages │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                           🔧 C/C++ DEVELOPMENT                              │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <F2>       ·········· Format C Code         <F4>       ··· Insert Header  │",
				"│   <F3>       ·········· Run Norminette        q (result) ··· Close Window   │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                            🔄 TOGGLE OPTIONS                                │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <leader>us ·········· Toggle Spelling       <leader>uh ··· Toggle Hints   │",
				"│   <leader>uw ·········· Toggle Wrap           <leader>ug ··· Toggle Indent   │",
				"│   <leader>uL ·········· Toggle Relative Num   <leader>uD ··· Toggle Dim     │",
				"│   <leader>ul ·········· Toggle Line Numbers   <leader>uc ··· Toggle Conceal │",
				"│   <leader>ub ·········· Toggle Background     <leader>uT ··· Toggle TreeSit  │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"╭─────────────────────────────────────────────────────────────────────────────╮",
				"│                            🎯 UTILITIES & SPECIAL                           │",
				"├─────────────────────────────────────────────────────────────────────────────┤",
				"│                                                                             │",
				"│   <leader>z  ·········· Toggle Zen Mode       <leader>r  ··· Rename File    │",
				"│   <leader>n  ·········· Notification History  gc        ··· Comment Lines   │",
				"│   <leader>?  ·········· This Cheatsheet       <leader>K  ··· All Keymaps    │",
				"│                                                                             │",
				"╰─────────────────────────────────────────────────────────────────────────────╯",
				"",
				"",
				"                       ╭────────────────────────────────╮",
				"                       │   Press 'q' or <Esc> to close  │",
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

return {
	-- fzf-lua: Fast and fully-featured fuzzy finder
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "FzfLua",
		keys = {
			-- PRIMARY FINDER - FZF takes precedence for fuzzy finding
			{ "<leader>F", "<cmd>FzfLua files<cr>", desc = "FZF Find Files" },
			{ "<leader>G", "<cmd>FzfLua live_grep<cr>", desc = "FZF Live Grep" },
			{ "<leader>B", "<cmd>FzfLua buffers<cr>", desc = "FZF Find Buffers" },
			{ "<leader>H", "<cmd>FzfLua help_tags<cr>", desc = "FZF Help Tags" },
			{ "<leader>R", "<cmd>FzfLua oldfiles<cr>", desc = "FZF Recent Files" },
			{ "<leader>fc", "<cmd>FzfLua grep_cword<cr>", desc = "FZF Grep Word Under Cursor" },
			{ "<leader>fC", "<cmd>FzfLua grep_cWORD<cr>", desc = "FZF Grep WORD Under Cursor" },
			
			-- GIT OPERATIONS - Prefix gf (git fzf)
			{ "<leader>gfs", "<cmd>FzfLua git_status<cr>", desc = "FZF Git Status" },
			{ "<leader>gfc", "<cmd>FzfLua git_commits<cr>", desc = "FZF Git Commits" },
			{ "<leader>gfC", "<cmd>FzfLua git_bcommits<cr>", desc = "FZF Git Buffer Commits" },
			{ "<leader>gfb", "<cmd>FzfLua git_branches<cr>", desc = "FZF Git Branches" },
			
			-- LSP OPERATIONS - Prefix lf (lsp fzf) 
			{ "<leader>lfr", "<cmd>FzfLua lsp_references<cr>", desc = "FZF LSP References" },
			{ "<leader>lfd", "<cmd>FzfLua lsp_definitions<cr>", desc = "FZF LSP Definitions" },
			{ "<leader>lfi", "<cmd>FzfLua lsp_implementations<cr>", desc = "FZF LSP Implementations" },
			{ "<leader>lft", "<cmd>FzfLua lsp_typedefs<cr>", desc = "FZF LSP Type Definitions" },
			{ "<leader>lfs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "FZF Document Symbols" },
			{ "<leader>lfS", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "FZF Workspace Symbols" },
			{ "<leader>lfa", "<cmd>FzfLua lsp_code_actions<cr>", desc = "FZF Code Actions" },
			{ "<leader>lfD", "<cmd>FzfLua lsp_workspace_diagnostics<cr>", desc = "FZF Workspace Diagnostics" },
			
			-- MISC OPERATIONS
			{ "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "FZF Keymaps" },
			{ "<leader>fT", "<cmd>FzfLua commands<cr>", desc = "FZF Commands" },
			{ "<leader>f:", "<cmd>FzfLua command_history<cr>", desc = "FZF Command History" },
			{ "<leader>f/", "<cmd>FzfLua search_history<cr>", desc = "FZF Search History" },
		},
		config = function()
			local fzf = require("fzf-lua")
			
			fzf.setup({
				"default-title", -- Use default title style
				winopts = {
					height = 0.85,
					width = 0.80,
					row = 0.35,
					col = 0.50,
					border = "rounded",
					preview = {
						default = "bat",
						border = "border",
						wrap = "nowrap",
						hidden = "nohidden",
						vertical = "down:45%",
						horizontal = "right:50%",
						layout = "flex",
						flip_columns = 120,
						title = true,
						scrollbar = "float",
					},
				},
				keymap = {
					builtin = {
						["<C-u>"] = "preview-page-up",
						["<C-d>"] = "preview-page-down",
						["<C-/>"] = "toggle-preview",
						["<C-f>"] = "preview-page-down",
						["<C-b>"] = "preview-page-up",
					},
					fzf = {
						["ctrl-u"] = "preview-page-up",
						["ctrl-d"] = "preview-page-down",
						["ctrl-f"] = "preview-page-down", 
						["ctrl-b"] = "preview-page-up",
						["ctrl-a"] = "beginning-of-line",
						["ctrl-e"] = "end-of-line",
						["alt-a"] = "toggle-all",
						["alt-q"] = "select-all+accept",
					},
				},
				previewers = {
					bat = {
						cmd = "bat",
						args = "--color=always --style=numbers,changes",
					},
					head = {
						cmd = "head",
						args = nil,
					},
					git_diff = {
						cmd_deleted = "git show HEAD~1:",
						cmd_modified = "git show HEAD:",
						cmd_untracked = "head",
					},
				},
				files = {
					prompt = "Files❯ ",
					multiprocess = true,
					git_icons = true,
					file_icons = true,
					color_icons = true,
					find_opts = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
					rg_opts = [[--color=never --files --hidden --follow -g "!.git"]],
					fd_opts = [[--color=never --type f --hidden --follow --exclude .git]],
				},
				grep = {
					prompt = "Rg❯ ",
					input_prompt = "Grep For❯ ",
					multiprocess = true,
					git_icons = true,
					file_icons = true,
					color_icons = true,
					rg_opts = [[--color=always --smart-case --hidden --column --line-number --no-heading]],
					rg_glob = false,
					glob_flag = "--iglob",
					glob_separator = "%s%-%-",
				},
				buffers = {
					prompt = "Buffers❯ ",
					file_icons = true,
					color_icons = true,
					sort_lastused = true,
					ignore_current_buffer = false,
				},
				oldfiles = {
					prompt = "History❯ ",
					cwd_only = false,
					stat_file = true,
					include_current_session = false,
				},
				git = {
					status = {
						prompt = "GitStatus❯ ",
						preview_pager = "delta --width=$COLUMNS",
					},
					commits = {
						prompt = "Commits❯ ",
						preview_pager = "delta --width=$COLUMNS",
					},
					bcommits = {
						prompt = "BCommits❯ ",
						preview_pager = "delta --width=$COLUMNS",
					},
					branches = {
						prompt = "Branches❯ ",
					},
				},
				lsp = {
					code_actions = {
						prompt = "Code Actions❯ ",
						ui_select = true,
					},
				},
			})

			-- Register fzf-lua as the default ui.select
			fzf.register_ui_select()
		end,
	},
}
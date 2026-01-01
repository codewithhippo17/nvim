-- [[ Enhanced Basic Keymaps - Ergonomic & Context-Aware ]]

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Enhanced Diagnostic navigation with count support
vim.keymap.set("n", "<leader>j", function()
	vim.diagnostic.goto_next({ count = vim.v.count1 })
end, { desc = "Next Diagnostic(s)" })

vim.keymap.set("n", "<leader>k", function()
	vim.diagnostic.goto_prev({ count = vim.v.count1 })
end, { desc = "Previous Diagnostic(s)" })

vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show Diagnostic" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Diagnostic Quickfix" })

-- Terminal mode escape (enhanced with Alt-e for consistency)
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "<A-e>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Window navigation (ergonomic Ctrl combinations)
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Focus left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Focus right window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Focus upper window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Focus lower window" })

-- Smart Window Resizing with Ctrl-Alt (adaptive sizing)
vim.keymap.set("n", "<C-A-h>", "<cmd>vertical resize -5<CR>", { desc = "Shrink window width" })
vim.keymap.set("n", "<C-A-l>", "<cmd>vertical resize +5<CR>", { desc = "Grow window width" })
vim.keymap.set("n", "<C-A-j>", "<cmd>resize +5<CR>", { desc = "Grow window height" })
vim.keymap.set("n", "<C-A-k>", "<cmd>resize -5<CR>", { desc = "Shrink window height" })

-- Floating Terminal (universal access)
vim.keymap.set("n", "<A-e>", function() Snacks.terminal() end, { desc = "Toggle Floating Terminal" })
vim.keymap.set("t", "<A-e>", function() Snacks.terminal() end, { desc = "Toggle Floating Terminal" })
vim.keymap.set("i", "<A-e>", function() Snacks.terminal() end, { desc = "Toggle Floating Terminal" })

-- Enhanced buffer management
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>bD", "<cmd>bd!<CR>", { desc = "Force close buffer" })

-- Smart Universal Finder - context-aware file finding
vim.keymap.set("n", "<leader>ff", function()
	-- Check if in a git repo first
	if vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null"):match("true") then
		-- Use Snacks git_files for git repos (faster)
		require("snacks").picker.git_files()
	else
		-- Fall back to regular files for non-git directories
		require("snacks").picker.files()
	end
end, { desc = "Smart Find Files" })

-- Quick Buffer Switching with enhanced preview
vim.keymap.set("n", "<leader>bb", function()
	require("snacks").picker.buffers()
end, { desc = "Switch Buffers" })

-- Session options fix for auto-session warning
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

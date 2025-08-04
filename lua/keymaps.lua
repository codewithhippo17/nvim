-- [[ Basic Keymaps - Ergonomic & Home Row Optimized ]]

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic navigation (home row keys)
vim.keymap.set("n", "<leader>j", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>k", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show Diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic Quickfix" })

-- Terminal mode escape
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Window navigation (ergonomic Ctrl combinations)
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Focus left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Focus right window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Focus upper window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Focus lower window" })

-- Fast Window Resizing with Ctrl-Alt (5 units at a time)
vim.keymap.set("n", "<C-A-h>", "<cmd>vertical resize -5<CR>", { desc = "Shrink window width" })
vim.keymap.set("n", "<C-A-l>", "<cmd>vertical resize +5<CR>", { desc = "Grow window width" })
vim.keymap.set("n", "<C-A-j>", "<cmd>resize +5<CR>", { desc = "Grow window height" })
vim.keymap.set("n", "<C-A-k>", "<cmd>resize -5<CR>", { desc = "Shrink window height" })

-- Floating Terminal (centered)
vim.keymap.set("n", "<A-e>", function() Snacks.terminal() end, { desc = "Toggle Floating Terminal" })
vim.keymap.set("t", "<A-e>", function() Snacks.terminal() end, { desc = "Toggle Floating Terminal" })
vim.keymap.set("i", "<A-e>", function() Snacks.terminal() end, { desc = "Toggle Floating Terminal" })

-- Buffer management (easy access)
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close buffer" })

-- Session options fix for auto-session warning
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

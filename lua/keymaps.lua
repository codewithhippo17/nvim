-- [[ Basic Keymaps - Ergonomic & Home Row Optimized ]]

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Quick rename (home row accessible)
vim.keymap.set("n", "<leader>rn", function()
	local word = vim.fn.expand("<cword>")
	local new_name = vim.fn.input("Rename '" .. word .. "' to: ")
	if new_name ~= "" then
		vim.cmd(":%s/\\<" .. word .. "\\>/" .. new_name .. "/g")
	end
end, { desc = "Rename variable under cursor" })

-- Diagnostic navigation (home row keys)
vim.keymap.set("n", "<leader>j", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>k", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic Quickfix" })

-- Terminal mode escape
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Window navigation (ergonomic Ctrl combinations)
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Focus left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Focus right window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Focus upper window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Focus lower window" })

-- Buffer management (easy access)
vim.keymap.set("n", "<leader>c", "<cmd>bd<CR>", { desc = "Close buffer" })

-- Git blame toggle (accessible key)
vim.keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<CR>", { desc = "Toggle Git Blame" })

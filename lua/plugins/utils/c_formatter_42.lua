-- ****************************************************************************
--
--                                                         :::      ::::::::
--    c_format.lua                                      :+:      :+:    :+:
--                                                     +:+ +:+         +:+
--    By: cacharle <me@cacharle.xyz>                 +#+  +:+       +#+
--                                                 +#+#+#+#+#+   +#+
--    Created: 2020/10/04 16:53:57 by cacharle          #+#    #+#
--    Updated: 2021/02/27 22:41:23 by jihypark         ###   ########.fr
--
-- ****************************************************************************

local M = {}

-- Configuration options
M.exec = vim.g.c_formatter_42_exec or "c_formatter_42"
M.set_equalprg = vim.g.c_formatter_42_set_equalprg or 0
M.format_on_save = vim.g.c_formatter_42_format_on_save or 0

-- Check if executable exists, install if not
if vim.fn.executable(M.exec) == 0 then
	vim.notify("Installing c_formatter_42")
	vim.cmd("!pip3 install --user c-formatter-42")
end

function M.format()
	local mark = vim.api.nvim_buf_get_mark(0, '"')
	local equalprg_tmp = vim.o.equalprg

	vim.o.equalprg = M.exec
	vim.cmd("silent normal! gg=G")
	vim.o.equalprg = equalprg_tmp

	vim.api.nvim_win_set_cursor(0, mark)
	vim.cmd("normal! zz")
end

function M.setup()
	if M.set_equalprg == 1 then
		vim.o.equalprg = M.exec
	end

	vim.api.nvim_create_augroup("c_formatter_42", { clear = true })

	if M.format_on_save == 1 then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = "c_formatter_42",
			pattern = "*.c,*.h",
			callback = M.format,
		})
	end

	vim.api.nvim_create_autocmd("FileType", {
		group = "c_formatter_42",
		pattern = "c,cpp",
		callback = function()
			vim.api.nvim_buf_create_user_command(0, "CFormatter42", M.format, {})
			vim.keymap.set("n", "<F2>", M.format, { buffer = true })
		end,
	})
end

function M.norminette()
	local current_file = vim.fn.expand("%:p")

	-- Run Norminette and get output
	local lines = {
		"Norminette result for " .. current_file,
		"",
		string.rep("-", 80),
	}
	local output = vim.fn.systemlist("norminette " .. current_file)
	vim.list_extend(lines, output)

	-- Create scratch buffer
	local buf = vim.api.nvim_create_buf(false, true)
	if not buf then
		return
	end

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.api.nvim_buf_set_option(buf, "modifiable", false)
	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

	-- Size of floating window
	local width = math.floor(vim.o.columns * 0.6)
	local height = math.min(#lines, math.floor(vim.o.lines * 0.6))
	local row = math.floor((vim.o.lines - height) / 2 - 1)
	local col = math.floor((vim.o.columns - width) / 2)

	-- Open floating window
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	-- Floating window options
	vim.wo[win].wrap = false
	vim.wo[win].cursorline = true
	vim.wo[win].number = false
	vim.wo[win].relativenumber = false

	-- Set 'q' to close the window
	vim.keymap.set("n", "q", function()
		if vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_win_close(win, true)
		end
	end, { buffer = buf, nowait = true })
end

-- Setup autocmd for norminette command
vim.api.nvim_create_augroup("c_formatter_42_norminette", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "c_formatter_42_norminette",
	pattern = "c,cpp",
	callback = function()
		vim.api.nvim_buf_create_user_command(0, "Norminette", M.norminette, {})
		vim.keymap.set("n", "<F3>", ":Norminette<CR>", { buffer = true, silent = true, desc = "Run Norminette" })
	end,
})

return M

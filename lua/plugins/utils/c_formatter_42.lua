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

	vim.cmd("belowright new")
	vim.bo.buftype = "nofile"
	vim.bo.bufhidden = "wipe"
	vim.bo.buflisted = false
	vim.bo.swapfile = false
	vim.wo.wrap = false

	local lines = {
		"Norminette result for " .. current_file,
		"",
		string.rep("-", 80),
	}
	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)

	local norminette_output = vim.fn.system("norminette " .. current_file)
	vim.api.nvim_buf_set_lines(0, 3, -1, false, vim.split(norminette_output, "\n"))

	vim.bo.modifiable = false

	local split_height = vim.api.nvim_buf_line_count(0)
	split_height = math.min(math.max(split_height, 10), 30)
	vim.cmd("silent resize " .. split_height)
	vim.cmd("normal! gg")

	vim.keymap.set("n", "q", "<cmd>q<CR>", { buffer = true, nowait = true })
end

-- Setup autocmd for norminette command
vim.api.nvim_create_augroup("c_formatter_42_norminette", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "c_formatter_42_norminette",
	pattern = "c,cpp",
	callback = function()
		vim.api.nvim_buf_create_user_command(0, "Norminette", M.norminette, {})
	end,
})

return M

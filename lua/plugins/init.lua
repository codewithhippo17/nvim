-- install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.g.c_formatter_42_set_equalprg = 1

require("lazy").setup({
	require("plugins.colorschemes"),
	require("plugins.utils.cmp"),
	require("plugins.utils.git"),
	require("plugins.utils.snacks"),
	require("plugins.utils.lsp"),
	require("plugins.utils.header"),
	require("plugins.utils.formatting"),
	require("plugins.utils.noice"),
	require("plugins.utils.utils"),
	{
		"mg979/vim-visual-multi",
		branch = "master",
		init = function()
			vim.g.VM_default_mappings = 1
			vim.g.VM_maps = {
				["Find Under"] = "<C-d>",
				["Find Subword Under"] = "<C-d>",
			}
		end,
	},
	{
		-- c_formatter_42 plugin spec
		dir = vim.fn.stdpath("config") .. "/lua/plugins/utils", -- Point to the directory containing c_formatter_42.lua
		name = "c_formatter_42", -- Give it a name
		ft = { "c", "cpp", "h" }, -- Only load for C/C++ files
		config = function()
			require("plugins.utils.c_formatter_42").setup()
		end,
	},
}, {
	ui = {
		-- If you have a Nerd Font, set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.g.c_formatter_42_set_equalprg = 1

require("lazy").setup({
	-- Essential plugins
	require("plugins.colorschemes"),
	require("plugins.utils.snacks"),
	require("plugins.utils.lsp"),
	require("plugins.utils.cmp"),
	require("plugins.utils.formatting"),
	require("plugins.utils.git"),
	require("plugins.utils.go"), -- Added Go support
	require("plugins.utils.auto-save"),
	require("plugins.utils.auto_session"),
	require("plugins.utils.header"),
	require("plugins.utils.noice"),
	require("plugins.utils.utils"),
	require("plugins.utils.multi_edit"),
	require("plugins.utils.opencode"),
	-- Visual multi (vim-visual-multi)
	{
		"mg979/vim-visual-multi",
		branch = "master",
		event = "VeryLazy",
		init = function()
			vim.g.VM_default_mappings = 1
			vim.g.VM_maps = {
				["Find Under"] = "<C-d>",
				["Find Subword Under"] = "<C-d>",
			}
		end,
	},

	-- C formatter 42 (custom plugin)
	{
		dir = vim.fn.stdpath("config") .. "/lua/plugins/utils",
		name = "c_formatter_42",
		ft = { "c", "cpp", "h" },
		config = function()
			require("plugins.utils.c_formatter_42").setup()
		end,
	},
}, {
	ui = {
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
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

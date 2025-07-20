return {
	{
		"mg979/vim-visual-multi",
		branch = "master",
		init = function()
			vim.g.VM_default_mappings = 1
			vim.g.VM_maps = {
				["Find Under"] = "<C-n>",
				["Find Subword Under"] = "<C-n>",
				["Select Cursor Down"] = "<C-M-j>",
				["Select Cursor Up"] = "<C-M-k>",
				["Select Cursor Right"] = "<C-M-l>",
				["Select Cursor Left"] = "<C-M-h>",
			}
		end,
	},
	-- other plugins...
}

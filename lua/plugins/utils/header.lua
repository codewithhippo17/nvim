return {
	"Diogo-ss/42-header.nvim",
	cmd = { "Stdheader" },
	keys = {
		{ "<C-M-h>", "<cmd>Stdheader<CR>", desc = "Insert 42 Header" },
	},
	opts = {
		auto_update = true,
		user = "elhaiba hamza",
		mail = "ehamza@student.1337.ma",
	},
	config = function(_, opts)
		require("42header").setup(opts)
	end,
}

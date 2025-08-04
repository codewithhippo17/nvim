return {
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		opts = {
			message_template = " <summary> • <date> • <author> • <<sha>>",
			date_format = "%r",
			message_when_not_committed = "Uncommitted changes",
			delay = 0,
			highlight_group = "Question",
			virtual_text_column = 1,
		},
		config = function()
			-- Remove duplicate keymap - handled in snacks keys
		end,
	},

	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
}

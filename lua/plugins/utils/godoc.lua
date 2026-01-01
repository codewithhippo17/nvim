return {
	-- godoc.nvim - Go documentation browsing with fzf-lua picker
	{
		"fredrikaverpil/godoc.nvim",
		version = "*",
		dependencies = {
			{ "ibhagwan/fzf-lua" }, -- Use fzf-lua as the picker
		},
		build = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- optional for enhanced symbol search
		cmd = { "GoDoc" }, 
		ft = { "go", "godoc" }, 
		keys = {
			-- Go documentation (go files only) - No conflicts with snacks
			{ "<leader>god", "<cmd>GoDoc<cr>", desc = "Browse Go documentation", ft = "go" },
			{ "<leader>goD", function() 
				local word = vim.fn.expand("<cword>")
				vim.cmd("GoDoc " .. word)
			end, desc = "Go doc for word under cursor", ft = "go" },
			-- FZF Go-specific operations using 'gof' prefix (go fzf)
			{ "<leader>gof", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Go symbols in file", ft = "go" },
			{ "<leader>goF", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "Go symbols in workspace", ft = "go" },
			{ "<leader>gor", "<cmd>FzfLua lsp_references<cr>", desc = "Go references", ft = "go" },
			{ "<leader>goi", "<cmd>FzfLua lsp_implementations<cr>", desc = "Go implementations", ft = "go" },
		},
		opts = {
			-- Set fzf-lua as the default picker
			picker = "fzf-lua",
			adapters = {
				{
					name = "go",
					opts = {
						get_syntax_info = function()
							return {
								filetype = "godoc",
								language = "godoc", -- Enable tree-sitter godoc parser
							}
						end,
					},
				},
			},
		},
	},
}
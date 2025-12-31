return {
	-- Go Language Server with enhanced configuration
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"gopls",
				"gofumpt", 
				"goimports-reviser",
				"golines",
				"delve", -- Go debugger
			})
		end,
	},

	-- Debug Adapter Protocol for Go
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			
			-- Setup DAP UI
			dapui.setup()
			
			-- Auto-open/close DAP UI
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	-- Go-specific debugging
	{
		"dreamsofcode-io/nvim-dap-go",
		ft = "go",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			require("dap-go").setup()
		end,
	},

	-- Go utilities and struct tags
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("gopher").setup()
		end,
		build = function()
			vim.cmd [[silent! GoInstallDeps]]
		end,
	},

	-- Enhanced LSP configuration for Go
	{
		"neovim/nvim-lspconfig", 
		opts = {
			servers = {
				gopls = {
					settings = {
						gopls = {
							gofumpt = true,
							codelenses = {
								gc_details = false,
								generate = true,
								regenerate_cgo = true,
								run_govulncheck = true,
								test = true,
								tidy = true,
								upgrade_dependency = true,
								vendor = true,
							},
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
							analyses = {
								fieldalignment = true,
								nilness = true,
								unusedparams = true,
								unusedwrite = true,
								useany = true,
							},
							usePlaceholders = true,
							completeUnimported = true,
							staticcheck = true,
							directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
							semanticTokens = true,
						},
					},
				},
			},
		},
	},

	-- Go formatting with null-ls integration
	{
		"nvimtools/none-ls.nvim", -- Updated null-ls
		ft = "go",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			
			null_ls.setup({
				sources = {
					-- Go formatters
					null_ls.builtins.formatting.gofumpt.with({
						extra_args = { "-extra" },
					}),
					null_ls.builtins.formatting.goimports_reviser,
					null_ls.builtins.formatting.golines.with({
						extra_args = { "--max-len=120" },
					}),
				},
				-- Auto format on save for Go files
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						local augroup = vim.api.nvim_create_augroup("GoLspFormatting", {})
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ 
									bufnr = bufnr,
									filter = function(client)
										return client.name == "null-ls"
									end
								})
							end,
						})
					end
				end,
			})
		end,
	},
}
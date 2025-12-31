return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/lazydev.nvim", ft = "lua", opts = {} }, -- Updated from neodev to lazydev
		},
		config = function()
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- LSP Navigation (with fallback to standard LSP)
					map("gd", function() 
						if pcall(require, "snacks") and require("snacks").picker then
							require("snacks").picker.lsp_definitions()
						else
							vim.lsp.buf.definition()
						end
					end, "Go to Definition")
					
					map("gr", function() 
						if pcall(require, "snacks") and require("snacks").picker then
							require("snacks").picker.lsp_references()
						else
							vim.lsp.buf.references()
						end
					end, "Go to References")
					
					map("gi", function() 
						if pcall(require, "snacks") and require("snacks").picker then
							require("snacks").picker.lsp_implementations()
						else
							vim.lsp.buf.implementation()
						end
					end, "Go to Implementation")
					
					map("gy", function() 
						if pcall(require, "snacks") and require("snacks").picker then
							require("snacks").picker.lsp_type_definitions()
						else
							vim.lsp.buf.type_definition()
						end
					end, "Go to Type Definition")
					
					-- Document & Workspace symbols (with fallback)
					map("<leader>ds", function() 
						if pcall(require, "snacks") and require("snacks").picker then
							require("snacks").picker.lsp_symbols()
						else
							vim.lsp.buf.document_symbol()
						end
					end, "Document Symbols")
					
					map("<leader>ws", function() 
						if pcall(require, "snacks") and require("snacks").picker then
							require("snacks").picker.lsp_workspace_symbols()
						else
							vim.lsp.buf.workspace_symbol()
						end
					end, "Workspace Symbols")

					-- LSP Actions (ergonomic)
					map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
					map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("gD", vim.lsp.buf.declaration, "Go to Declaration")

					-- Document highlighting
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
							end,
						})
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				intelephense = {
					root_dir = require("lspconfig").util.root_pattern("composer.json", ".git", "*.php"),
					settings = {
						intelephense = {
							files = {
								maxSize = 5000000,
							},
						},
					},
				},
				pyright = {},
				gopls = {
					cmd = {"gopls"},
					filetypes = { "go", "gomod", "gowork", "gotmpl" },
					root_dir = require("lspconfig").util.root_pattern("go.work", "go.mod", ".git"),
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
				clangd = {
					cmd = { "clangd", "--background-index", "--clang-tidy" },
					root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "compile_commands.json"),
					capabilities = vim.tbl_deep_extend("force", capabilities, {
						offsetEncoding = { "utf-16" },
					}),
				},
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = { 
								disable = { "missing-fields" },
								globals = { "vim" },
							},
							workspace = {
								checkThirdParty = false,
							},
						},
					},
				},
			}

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers)
			vim.list_extend(ensure_installed, {
				"stylua",
				"rustfmt",
				"rust_analyzer",
				"html",
				"tailwindcss-language-server",
				"typescript-language-server",
				"clang-format",
			})

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
				automatic_installation = true,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}

return {
	{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },

	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		opts = {
			options = {
				indicator = { icon = "▎", style = "icon" },
				offsets = {
					{ filetype = "snacks_explorer", text = "File Explorer", text_align = "center", padding = 0 },
				},
				separator_style = "thin",
			},
		},
		config = function()
			require("bufferline").setup()
			-- Buffer navigation with Shift+hjkl (hjkl for directional movement)
			vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<S-j>", "<Cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<S-k>", "<Cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true })

			-- Tab navigation (proper vim tabs)
			vim.keymap.set("n", "<Tab>", "gt", { noremap = true, silent = true })
			vim.keymap.set("n", "<S-Tab>", "gT", { noremap = true, silent = true })
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate godoc go", -- install/update parsers including godoc
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc", "python", "go", "godoc" },
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			-- Configure godoc parser before setting up treesitter
			require("nvim-treesitter.parsers").godoc = {
				install_info = {
					url = "https://github.com/fredrikaverpil/tree-sitter-godoc",
					files = { "src/parser.c" },
					version = "*",
				},
				filetype = "godoc",
			}

			-- Map godoc filetype to use godoc parser
			vim.treesitter.language.register('godoc', 'godoc')

			-- Enable godoc filetype for .godoc files (optional)
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = "*.godoc",
				callback = function()
					vim.bo.filetype = "godoc"
				end,
			})

			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				theme = "auto",
				height = 20,
			},
		},
	},

	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		"echasnovski/mini.icons",
		lazy = true,
		opts = {},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},

	{ "numToStr/Comment.nvim", event = "VeryLazy", opts = {} }, -- "gc" to comment visual regions/lines

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup({
				spec = {
					{ "<leader>c", group = "[C]ode" },
					{ "<leader>d", group = "[D]iagnostic/Debug" },
					{ "<leader>f", group = "[F]ind (Snacks)" }, -- Snacks finder
					{ "<leader>F", group = "[F]ZF Operations" }, -- FZF finder  
					{ "<leader>g", group = "[G]it/Go" }, -- Git and Go operations
					{ "<leader>gf", group = "Git [F]ZF" }, -- Git with FZF
					{ "<leader>go", group = "[Go] Operations" }, -- Go-specific
					{ "<leader>gof", group = "Go F[Z]F" }, -- Go with FZF
					{ "<leader>l", group = "[L]SP" }, -- LSP operations
					{ "<leader>lf", group = "LSP F[Z]F" }, -- LSP with FZF
					{ "<leader>o", group = "[O]penCode AI" }, -- AI operations
					{ "<leader>r", group = "[R]ename" },
					{ "<leader>s", group = "[S]earch/Spectre" }, -- Search operations
					{ "<leader>u", group = "[U]tilities/Toggle" }, -- Toggle utilities
					{ "<leader>w", group = "[W]orkspace" },
				},
			})
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		ft = { "html", "xml", "tsx", "jsx", "vue", "svelte" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{
		"github/copilot.vim",
		event = "InsertEnter",
		config = function()
			-- Copilot keymaps (ergonomic Alt combinations)
			vim.keymap.set("i", "<A-a>", 'copilot#Accept("<CR>")', { expr = true, replace_keycodes = false })
			vim.keymap.set("i", "<A-w>", "<Plug>(copilot-accept-word)")
			vim.keymap.set("i", "<A-j>", "<Plug>(copilot-next)")
			vim.keymap.set("i", "<A-k>", "<Plug>(copilot-previous)")
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
		end,
	},

	{
		"nvim-pack/nvim-spectre",
		keys = {
			{
				"<leader>sf",
				function()
					require("spectre").toggle()
				end,
				desc = "Find & Replace",
			},
		},
		config = function()
			require("spectre").setup({ is_block_ui_break = true })
		end,
	},
}

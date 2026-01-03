return {
	"okuuva/auto-save.nvim",
	version = "^1.0.0",
	event = { "InsertLeave", "TextChanged" },
	opts = {
		enabled = true,
		-- execution_message removed - deprecated option
		trigger_events = {
			immediate_save = { "BufLeave", "FocusLost" },
			defer_save = { "InsertLeave", "TextChanged" },
			cancel_deferred_save = { "InsertEnter" }, -- Fixed: defered → deferred
		},
		condition = function(buf)
			-- Don't save for certain file types
			local filetype = vim.bo[buf].filetype
			local excluded_filetypes = {
				"oil",
				"snacks_explorer",
				"gitcommit",
				"gitrebase",
			}
			return not vim.tbl_contains(excluded_filetypes, filetype)
		end,
		write_all_buffers = false,
		debounce_delay = 50, -- Quick saving with minimal delay
		callbacks = {
			before_saving = function()
				-- Format before saving if conform is available
				local conform_ok, conform = pcall(require, "conform")
				if conform_ok then
					conform.format({ async = false, lsp_fallback = true })
				end
			end,
		},
	},
}

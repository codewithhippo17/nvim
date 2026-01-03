--[[ return {
	"rmagatti/auto-session",
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		-- log_level = 'debug',
	},
} ]]

return {
	"rmagatti/auto-session",
	lazy = false,

	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		
		-- Add session validation and error handling
		session_lens = {
			load_on_setup = true,
		},
		
		-- Better error handling for session restore
		pre_restore_cmds = {
			function()
				-- Clear any potential conflicts before restore
				vim.cmd("silent! %bdelete!")
			end,
		},
		
		post_restore_cmds = {
			function()
				-- Safe snacks explorer restore with error handling
				local ok, snacks = pcall(require, "snacks")
				if ok and snacks.explorer then
					pcall(snacks.explorer)
				end
			end,
		},
		
		-- Suppress auto-save on session errors
		auto_save_enabled = function()
			-- Don't auto-save if we're in an error state
			return vim.v.dying == 0
		end,
	},
}

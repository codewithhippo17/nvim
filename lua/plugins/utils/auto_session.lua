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

		post_restore_cmds = {
			function()
				local ok, snacks = pcall(require, "snacks")
				if ok then
					snacks.explorer() -- Reopen snacks file explorer
				end
			end,
		},
	},
}

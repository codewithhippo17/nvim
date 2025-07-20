return {
	"okuuva/auto-save.nvim",
	version = "^1.0.0",
	event = { "TextChanged", "TextChangedI" },
	opts = {
		enabled = true,
		-- Optional: configure debounce delay to avoid excessive saves (default 135ms)
		debounce_delay = 100,
	},
}

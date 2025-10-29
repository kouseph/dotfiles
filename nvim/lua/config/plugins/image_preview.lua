-- lazy.nvim
-- lazy.nvim
return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		image = {
			enabled = true,
			inline = true,
			backend = "kitty",   -- wezterm supports kitty protocol
			doc = {
				enabled = true,
				inline = false,
				max_width = 40,
				max_height = 20,
			},
		},
	},
}

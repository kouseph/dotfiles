return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		'DaikyXendo/nvim-material-icon',
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- optionally enable 24-bit colour
		vim.opt.termguicolors = true

		require("nvim-tree").setup({
			view = {
				side = "right", -- make NvimTree appear on the right
				width = 30,     -- optional: adjust width
			},
			git = {
				enable = true,
				ignore = false,   -- ← show gitignored files
			},
			filters = {
				dotfiles = false, -- ← show dotfiles as well
			},
		})
	end,
}

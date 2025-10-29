return {
	{
		"refractalize/oil-git-status.nvim",
		dependencies = {
			"stevearc/oil.nvim",
		},
		config = true,
	},

	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		lazy = false,
		config = function()
			require("oil").setup({
				delete_to_trash = true,
				win_options = {
					signcolumn = "yes:2",
				},
				keymaps = {
					["h"] = { "actions.parent", mode = "n" },
					["l"] = { "actions.select", mode = "n"},
					["<leader>pf"] = {
						function()
							require("telescope.builtin").find_files({
								cwd = require("oil").get_current_dir()
							})
						end,
						mode = "n",
						nowait = true,
						desc = "Find files in the current directory"
					},
					['q'] = { "actions.close", mode = "n" },
					["."] = { "actions.toggle_hidden", mode = "n" },
				}
			})
		end,
	},
}

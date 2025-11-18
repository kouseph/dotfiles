return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	enabled=true,
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>pf', function()
			require('telescope.builtin').find_files({
				hidden = true,
				no_ignore = true,
				no_ignore_parent = true,
				file_ignore_patterns = { "%.git/", "node_modules/", ".venv/", "venv/" },
			})
		end, { desc = 'Telescope find all files (including dotfiles)' })

		vim.keymap.set('n', "<leader>pg", builtin.git_files, { desc = "search git files" })

		vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })

		vim.keymap.set('n', '<leader>g', function()
			require('telescope.builtin').live_grep({
				hidden = true,
				additional_args = function(_)
					return {
						"--no-ignore",      -- ignore .gitignore
						"--hidden",         -- include dotfiles
						"--glob", "!.git/*",
						"--glob", "!node_modules/*",
						"--glob", "!.venv/*",
						"--glob", "!venv/*",
					}
				end,
			})
		end, { desc = 'Telescope grep string (including .gitignore files)' })
	end,
}

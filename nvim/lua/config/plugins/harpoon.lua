return {
	{ 'nvim-lua/plenary.nvim' },
	{
		'ThePrimeagen/harpoon',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon add file" })
			vim.keymap.set("n", "<C-p>", ui.toggle_quick_menu, { desc = "Harpoon menu" })
			vim.keymap.set("n", "<C-t>", function() ui.nav_file(1) end)
			vim.keymap.set("n", "<C-n>", function() ui.nav_file(2) end)
			vim.keymap.set("n", "<C-s>", function() ui.nav_file(3) end)
		end,
	},
}


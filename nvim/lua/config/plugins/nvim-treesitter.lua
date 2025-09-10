return {
	"nvim-treesitter/nvim-treesitter",
--	branch = "main", -- default is master; omit or set explicitly

	build = ":TSUpdate",
	main = "nvim-treesitter.configs",  -- lazy will call .setup(opts) for you
	opts = function()
		return {
			ensure_installed = {
				"javascript","toml","python",
				"cpp","c","lua","vim","vimdoc",
				"query","markdown","markdown_inline",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		}
	end,
}

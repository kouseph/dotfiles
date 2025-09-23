return {
	"lervag/vimtex",
	lazy = false,     -- load immediately (good for VimTeX)
	init = function()
		-- set globals *before* plugin loads
		vim.g.vimtexd_view_method = "zathura"
		-- vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_view_zathura_options = [[--fork --synctex-forward @line:0:@tex @pdf]]
		vim.g.vimtex_syntax_enabled = 0
		vim.g.vimtex_compiler_latexmk = {
			aux_dir='/Users/joseph/.texfiles/',
			out_dir='/Users/joseph/.texfiles',
		}

	end,
}

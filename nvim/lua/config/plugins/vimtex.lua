return {
	"lervag/vimtex",
	lazy = false, -- load immediately (good for VimTeX)
	init = function()
		-- set globals *before* plugin loads
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_syntax_enabled = 0
		vim.t.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_compiler_latexmk = {
			aux_dir = "/Users/joseph/.texfiles/aux",
			options = { "-synctex=0" },
		}
	end,
}

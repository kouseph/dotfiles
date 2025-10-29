--:help lspconfig-all
--:echo executable("<name of lsp>")
return {
	"neovim/nvim-lspconfig",
	dependencies = { "Saghen/blink.cmp" },
	opts = {
		servers = {
			pylsp = {
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								ignore = { "E501", "E226", "E303", "E231" },
							},
						},
					},
				},
			},
			clangd = {},
			marksman = {},
			texlab = {},
			tailwindcss = {},
			ts_ls = {},
			jsonls = {},
			eslint = {}
		},
	},

	config = function(_, opts)
		-- local lspconfig = require("lspconfig")

		local on_attach = function(_, bufnr)
			local o = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, o)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, o)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, o)
			vim.keymap.set("n", "K",  vim.lsp.buf.hover, o)
			vim.keymap.set("n", "]e", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
			vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
		end

		vim.lsp.config('*', {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
			on_attach = on_attach,
		})

		-- per-server overrides + enable
		for name, cfg in pairs(opts.servers) do
			vim.lsp.config(name, cfg)   -- register/merge this server’s config
			vim.lsp.enable(name)        -- activate it
		end
	end,
}

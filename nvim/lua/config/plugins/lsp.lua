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
								ignore = { "E501", "E226", "E303" },  -- line too long, missing whitespace for ops 
								-- maxLineLength = 100, -- optional override
							},
						},
					},
				},
			},
			clangd = {},
			marksman = {},
		},
	},

	config = function(_, opts)
		local lspconfig = require("lspconfig")

		local on_attach = function(_, bufnr)
			local o = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, o)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, o)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, o)
			vim.keymap.set("n", "K",  vim.lsp.buf.hover, o)
			vim.keymap.set("n", "]e", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
			vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
		end

		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			config.on_attach = on_attach
			lspconfig[server].setup(config)
		end
	end,
}

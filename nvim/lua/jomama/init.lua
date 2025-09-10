require("jomama.remap")
require("config.lazy")

-- ========== COLOR SCHEME ============
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- =========== LINE NUMBERS ==============
vim.opt.number = true
vim.opt.relativenumber = true

-- ============= WRAPPING ================
vim.opt.wrap = false          -- wrap long lines onto the next screen line
vim.opt.linebreak = true -- wrap at word boundaries (not in the middle of a word)
vim.opt.breakindent = true -- keep indentation when wrapping
vim.opt.showbreak = "   ↳ "
vim.opt.list = true
vim.opt.listchars = {
	extends = "…",
	precedes = "…",
	tab = "  ",   -- two spaces: hides the '>' tab marker
	trail = " ",  -- optional: hide trailing-space marker too
}
vim.keymap.set("n", "<leader>w", function()
	local enable = not vim.opt.wrap:get()
	vim.opt.wrap = enable
	vim.opt.linebreak = enable
	vim.opt.breakindent = enable
end, { desc = "Toggle pretty line wrap" })

-- ================== LSP ===================
vim.diagnostic.config({
  virtual_text = true,   -- show inline
  signs = true,          -- show in sign column
  underline = true,      -- underline offending code
  update_in_insert = true,
})
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local o = { buffer = event.buf, noremap = true, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, o)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, o)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, o)
    vim.keymap.set("n", "K",  vim.lsp.buf.hover, o)
  end,
})
vim.lsp.config["luals"] = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = {
        disable = { "missing-fields" },
        globals = { "vim" },
      },
    },
  },
}

vim.lsp.enable("luals")

-- ================== FILE TYPES =================
vim.filetype.add({
  extension = {
    md = "markdown",
  },
})



-- ================ OTHER SETTINGS ==============
-- don't continue commenting when entering after commented line
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- start scrolling earlier
vim.opt.scrolloff = 5

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- copy and paste with mac's copy history
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars:append({ eob = " " })

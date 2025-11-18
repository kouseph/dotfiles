require("jomama.remap")
require("config.lazy")



-- ========== COLOR SCHEME ============
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.o.winborder = "rounded" --so that float color can be transparent and it can be more legible

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
  vim.schedule(function()
    vim.cmd("normal! zz")
  end)
end, { desc = "Toggle pretty line wrap" })

-- ================== LSP ===================
vim.diagnostic.config({
  virtual_text = true,   -- show inline
  signs = true,          -- show in sign column
  underline = true,      -- underline offending code
  update_in_insert = true,
})
vim.bo.tabstop = 4
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "lua" },
  callback = function()
    vim.bo.tabstop = 2        -- how many spaces a TAB displays as
    vim.bo.shiftwidth = 2     -- how many spaces for indentation operations
    vim.bo.expandtab = true   -- convert TAB key -> spaces
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "hpp", "cc", "cxx", "latex", "text" },
  callback = function()
    vim.bo.tabstop = 4        -- how many spaces a TAB displays as
    vim.bo.shiftwidth = 4     -- how many spaces for indentation operations
    vim.bo.expandtab = true   -- convert TAB key -> spaces
  end,
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


-- ================= blink.cmp toggle ==============
-- toggle blink.cmp on/off

vim.api.nvim_create_user_command("BlinkToggle", function()
  vim.g.blink_disabled_global = not vim.g.blink_disabled_global
  print(vim.g.blink_disabled_global and "blink.cmp OFF globally" or "blink.cmp ON globally")
end, {})

-- ================ OTHER SETTINGS ==============
-- column transparent
vim.o.signcolumn = "yes"
vim.cmd [[highlight ctermbg=NONE guibg=NONE ]]


-- Fold settings
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldenable = false -- keeps code open by default
vim.o.foldlevel = 99     -- avoids everything collapsing immediately


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
-- vim.opt.fillchars:append({ eob = " " })

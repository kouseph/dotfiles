vim.g.mapleader = (" ")
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-h>', 'zh', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', 'gj', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', 'gk', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', 'zl', { noremap = true, silent = true})

vim.keymap.set('v', '<leader>p', "\"_dP")

vim.keymap.set('n', '<leader>c', '1z=')

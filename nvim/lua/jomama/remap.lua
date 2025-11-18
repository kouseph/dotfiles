vim.g.mapleader = (" ")
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-h>', 'zh', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', 'gj', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', 'gk', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', 'zl', { noremap = true, silent = true})

vim.keymap.set('v', '<leader>p', "\"_dP") -- pastes and doesn't copy what has been deleted

vim.keymap.set('n', '<leader>c', '1z=')

vim.keymap.set('n', '<leader>q', ':wqa<CR>')
vim.keymap.set('n', '<leader>s', ':set spell<CR>')
vim.keymap.set('n', '<leader>ns', ':set nospell<CR>')

vim.keymap.set('n', '<leader>ac', ':BlinkToggle<CR>')

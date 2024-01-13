vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "H", "^", { noremap = true, silent = true })
vim.keymap.set("n", "L", "$", { noremap = true, silent = true })
vim.keymap.set("n", "@c", '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>n', ':set relativenumber!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })

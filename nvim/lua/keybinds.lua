--Use Specialized Dvorak keybindings
vim.api.nvim_set_keymap("v", "e", "d", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "t", "k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "n", "j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "s", "l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "o", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ".", "w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ",", "b", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "p", "o", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "t", "k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "n", "j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "s", "l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "o", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ".", "w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ",", "b", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'l', 'p', { noremap = true, silent = true })

--indents single press
vim.api.nvim_set_keymap('n', '<', '<<', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '>', '>>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'T', 'n', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'N', 'N', {noremap = true, silent = true})

-- Map 'Ctrl+v' to paste from system clipboard in visual or insert
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "ee", ":lua delete_line()<CR>", { noremap = true, silent = true })
--Control backspace
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-w>', { noremap = true, silent = true })

-- Map 'Ctrl+v' to paste from system clipboard in visual or insert
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>z', ':lua toggle_zen()<CR>', { noremap = true, silent = true })
vim.api.nvim_create_user_command('W', 'write', {})

-- Map '\' to :noh (clear search highlights)
vim.keymap.set('n', '\\', '<Cmd>nohlsearch|diffupdate|normal! <C-l><CR>', { silent = true })

vim.g.mapleader = " "  -- Leader key space

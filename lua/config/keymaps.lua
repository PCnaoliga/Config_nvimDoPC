-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps her-- Mapear jj para sair do modo de inserção

-- Mapear jj para sair do modo de inserção
vim.keymap.set("i", "jj", "<Esc>", { noremap = true })

-- Mapear qq para sair sem salvar
vim.keymap.set("n", "qq", ":q<CR>", { noremap = true, silent = true })

-- Mapear qw para salvar e sair
vim.keymap.set("n", "qw", ":wq<CR>", { noremap = true, silent = true })

-- Mapear QQ para sair forçado
vim.keymap.set("n", "QQ", ":q!<CR>", { noremap = true, silent = true })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map("i", "jj", "<Esc>", { desc = "Sair do insert com jj" })
map("n", "<leader>q", ":wq<CR>", { desc = "Salvar e sair" })

vim.keymap.set("n", "<leader>lt", function()
  require("live-server-nvim").toggle()
end, { desc = "Toggle Live Server" })

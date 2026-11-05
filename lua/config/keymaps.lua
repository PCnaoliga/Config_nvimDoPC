-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Atalhos inspirados no fluxo usado no Zed
local function toggle_explorer()
  Snacks.explorer({ cwd = LazyVim.root() })
end

local function toggle_terminal()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end

map({ "n", "i" }, "<M-q>", toggle_explorer, { desc = "Alternar explorador de arquivos" })
map({ "n", "i", "t" }, "<M-e>", toggle_terminal, { desc = "Alternar terminal" })

map("n", "<C-Left>", "<C-w>h", { desc = "Ir para a janela à esquerda", remap = true })
map("n", "<C-Down>", "<C-w>j", { desc = "Ir para a janela abaixo", remap = true })
map("n", "<C-Up>", "<C-w>k", { desc = "Ir para a janela acima", remap = true })
map("n", "<C-Right>", "<C-w>l", { desc = "Ir para a janela à direita", remap = true })

map("n", "<C-S-Left>", "<cmd>bprevious<cr>", { desc = "Buffer anterior" })
map("n", "<C-S-Right>", "<cmd>bnext<cr>", { desc = "Próximo buffer" })
map("n", "<C-S-q>", function()
  Snacks.bufdelete()
end, { desc = "Fechar buffer atual" })

map("i", "jj", "<Esc>", { desc = "Sair do insert com jj" })
map("n", "<leader>q", ":wq<CR>", { desc = "Salvar e sair" })

vim.keymap.set("n", "<leader>lt", function()
  require("live-server-nvim").toggle()
end, { desc = "Toggle Live Server" })

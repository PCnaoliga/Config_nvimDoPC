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

local function new_terminal()
  require("tiny-term").open(nil, {
    cwd = LazyVim.root(),
    win = { position = "bottom" },
  })
end

local function cycle_terminal(direction)
  local terminal = require("tiny-term.terminal")
  local window = require("tiny-term.window")
  local win = vim.api.nvim_get_current_win()
  local terminals = window.get_split_terminals(win)

  if #terminals < 2 then
    return
  end

  local current_buf = vim.api.nvim_get_current_buf()
  local current_index = 1

  for index, terminal_id in ipairs(terminals) do
    local term = terminal.get(terminal_id)
    if term and term.buf == current_buf then
      current_index = index
      break
    end
  end

  local target_index = ((current_index - 1 + direction) % #terminals) + 1
  window.switch_to_terminal(win, terminals[target_index])
end

map({ "n", "i" }, "<M-q>", toggle_explorer, { desc = "Alternar explorador de arquivos" })
map({ "n", "i", "t" }, "<M-e>", toggle_terminal, { desc = "Alternar terminal" })
map({ "n", "i", "t" }, "<M-E>", new_terminal, { desc = "Criar nova aba de terminal" })

map("n", "<C-Left>", "<C-w>h", { desc = "Ir para a janela à esquerda", remap = true })
map("n", "<C-Down>", "<C-w>j", { desc = "Ir para a janela abaixo", remap = true })
map("n", "<C-Up>", "<C-w>k", { desc = "Ir para a janela acima", remap = true })
map("n", "<C-Right>", "<C-w>l", { desc = "Ir para a janela à direita", remap = true })

map("n", "<C-S-Left>", "<cmd>bprevious<cr>", { desc = "Buffer anterior" })
map("n", "<C-S-Right>", "<cmd>bnext<cr>", { desc = "Próximo buffer" })
map("n", "<C-S-q>", function()
  Snacks.bufdelete()
end, { desc = "Fechar buffer atual" })

local terminal_keymaps = vim.api.nvim_create_augroup("user_terminal_keymaps", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = terminal_keymaps,
  pattern = "tiny_term",
  callback = function(event)
    map({ "n", "t" }, "<C-S-Left>", function()
      cycle_terminal(-1)
    end, { buffer = event.buf, desc = "Terminal anterior" })
    map({ "n", "t" }, "<C-S-Right>", function()
      cycle_terminal(1)
    end, { buffer = event.buf, desc = "Próximo terminal" })
  end,
})

map("i", "jj", "<Esc>", { desc = "Sair do insert com jj" })
map("n", "<leader>q", ":wq<CR>", { desc = "Salvar e sair" })

vim.keymap.set("n", "<leader>lt", function()
  require("live-server-nvim").toggle()
end, { desc = "Toggle Live Server" })

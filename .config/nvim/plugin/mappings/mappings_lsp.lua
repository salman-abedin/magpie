local map = require('map')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map('n', '<leader>a', vim.lsp.buf.format)

local lsp_enabled = 1
local toggle_lsp = function()
  if lsp_enabled == 1 then
    vim.diagnostic.disable()
    lsp_enabled = 0
  else
    vim.diagnostic.enable()
    lsp_enabled = 1
  end
end
map('n', '<leader>l', toggle_lsp)

map('n', '<leader>W', vim.diagnostic.goto_next)
map('n', '<leader>w', vim.diagnostic.goto_prev)

map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gr', require('telescope.builtin').lsp_references)

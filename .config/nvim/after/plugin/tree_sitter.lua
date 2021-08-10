if not pcall(require, 'nvim-treesitter') then return end

require'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  highlight = {enable = true},
  rainbow = {enable = true},
  indent = {enable = true}
  -- autotag = {enable = true}
  -- context_commentstring = {enable = true}
}

-- Enable treesitter folding
vim.cmd [[
autocmd FileType sh,c,cpp,python,vue setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
]]

-- local map = require('utils')
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.cmd [[ autocmd BufEnter * lua require'completion'.on_attach() ]]
-- map('i', '<tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', {expr = true})
-- map('i', '<s-tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', {expr = true})

-- vim.g.completion_confirm_key = '<c-y>'
-- map('i', '<CR>', 'pumvisible() ? "<C-y>" : "<CR>"', {expr = true})
-- map('i', '<tab>', 'pumvisible() ? "<C-n><C-y>" : "<Tab>"', {expr = true})
-- map('i', '<s-tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', {expr = true})

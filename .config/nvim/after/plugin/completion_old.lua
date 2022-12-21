if not pcall(require, 'compe') then
    return
end

vim.o.completeopt = 'menuone,noselect'
--  vim.o.completeopt = 'menuone,noselect,noinsert'

local map = require('map')

map('i', '<tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', {expr = true})
map('i', '<s-tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', {expr = true})

require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
        path = true,
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
        vsnip = true
    }
}

-- vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
-- vim.cmd [[ autocmd BufEnter * lua require'completion'.on_attach() ]]
-- vim.g.completion_confirm_key = '<c-y>'
-- map('i', '<CR>', 'pumvisible() ? "<C-y>" : "<CR>"', {expr = true})
-- map('i', '<tab>', 'pumvisible() ? "<C-n><C-y>" : "<Tab>"', {expr = true})
-- map('i', '<s-tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', {expr = true})

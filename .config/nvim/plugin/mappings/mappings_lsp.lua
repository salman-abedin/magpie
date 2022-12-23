local map = require('map')

map('n', '<space>a', vim.lsp.buf.format)

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
map('n', '<space>l', toggle_lsp)

-- map('n', '<leader>W', vim.diagnostic.goto_next)
-- map('n', '<leader>w', vim.diagnostic.goto_prev)
map('n', '<space>h', vim.diagnostic.open_float)

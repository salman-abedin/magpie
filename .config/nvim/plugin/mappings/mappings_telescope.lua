local map = require('map')
local builtin = require('telescope.builtin')

map('n', '<space>f', builtin.find_files)
map('n', '<space>/', builtin.live_grep)

map('n', 'gd', builtin.lsp_definitions)
map('n', 'gr', builtin.lsp_references)
map('n', '<space>d', builtin.diagnostics)

-- map('n', '<space>?', '<cmd>Telescope live_grep grep_open_files=true<cr>')
-- map('n', '<space>b', '<cmd>Telescope buffers<cr>')
-- map('n', '<space>F', '<cmd>Telescope file_browser<cr>')
--
-- -- quick browser
-- map('n', '<space>tc',
--     ':Telescope find_files cwd=/mnt/internal/git/system/magpie/.config/nvim<cr>')
-- map('n', '<space>td',
--     ':Telescope find_files cwd=/mnt/internal/git/system/magpie/.config<cr>')
-- map('n', '<space>tn',
--     ':Telescope find_files cwd=/mnt/internal/git/daily/notes<cr>')
-- map('n', '<space>tm',
--     ':Telescope find_files cwd=/mnt/internal/git/work/denim/src<cr>')

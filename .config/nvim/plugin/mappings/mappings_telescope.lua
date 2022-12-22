local map = require('map')

map('n', '<leader>f', require('telescope.builtin').find_files)
map('n', '<leader>/', require('telescope.builtin').live_grep)

-- map('n', '<leader>?', '<cmd>Telescope live_grep grep_open_files=true<cr>')
-- map('n', '<leader>b', '<cmd>Telescope buffers<cr>')
-- map('n', '<leader>F', '<cmd>Telescope file_browser<cr>')
--
-- -- quick browser
-- map('n', '<leader>tc',
--     ':Telescope find_files cwd=/mnt/internal/git/system/magpie/.config/nvim<cr>')
-- map('n', '<leader>td',
--     ':Telescope find_files cwd=/mnt/internal/git/system/magpie/.config<cr>')
-- map('n', '<leader>tn',
--     ':Telescope find_files cwd=/mnt/internal/git/daily/notes<cr>')
-- map('n', '<leader>tm',
--     ':Telescope find_files cwd=/mnt/internal/git/work/denim/src<cr>')

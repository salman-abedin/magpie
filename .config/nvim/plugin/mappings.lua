local map = require('utils').map

vim.g.mapleader = ' '

-- auto pairs{{{
map('i', '\'i', '\'\'<left>')
map('i', '"i', '""<left>')
map('i', '`i', '``<left>')
map('i', '(i', '()<left>')
map('i', '{i', '{}<left>')
map('i', '[i', '[]<left>')
map('i', '<i', '<><left>')

map('i', '\'a', '\'\'')
map('i', '"a', '""')
map('i', '`a', '``')
map('i', '(a', '()')
map('i', '{a', '{}')
map('i', '[a', '[]')
map('i', '<a', '<>')

map('i', '\'o', '\'<cr>\'<esc>O')
map('i', '"o', '"<cr>"<esc>O')
map('i', '`o', '`<cr>`<esc>O')
map('i', '(o', '(<cr>)<esc>O')
map('i', '{o', '{<cr>}<esc>O')
map('i', '[o', '[<cr>]<esc>O')
-- }}}
-- consistancy with default mappings{{{
map('n', 'Y', 'y$')
map('n', 'V', 'v$h')
map('n', 'vv', 'V')
map('n', 'U', '<c-r>')
map('n', '<leader>v', '<c-v>')
-- }}}

-- I Love My Pincky
map('i', 'kj', '<ESC>')

-- buffers
map('n', '<Tab>', ':bn<cr>', {silent = true})

-- telescope
map('n', '<leader>f', '<cmd>Telescope find_files<cr>')
map('n', '<leader>b', '<cmd>Telescope buffers<cr>')

-- map('n', '<leader>h', '<c-o>')
-- map('n', '<leader>l', '<c-i>')

-- map('n', '<cr>', '<cmd>silent wa<cr>', {silent = true})
map('n', '<cr>', ':silent up<cr>', {silent = true})
map('n', '<esc>', ':silent up | qa<cr>', {silent = true})
map('n', '<leader><esc>', ':qa!<cr>', {silent = true})

-- paste last yanked text
map('n', '<leader>p', '"0p')

-- folds
-- map('n', '<leader>j', 'zA')
map('n', '<leader>j', 'za')
map('n', '<leader>k', 'zM')

-- joins
-- map('n', '<leader>J', 'J')
-- map('n', '<leader>K', 'kJ')

-- -- spellings
-- map('n', '<leader>f', '1z=')
-- map('n', '<leader>F', 'i<C-X><C-S>')
-- map('n', '<leader>a', 'zg')
-- map('n', '<leader>A', 'zug')

map('n', 'u', '<cmd>silent undo<cr>', {silent = true})
map('n', '<leader>s', ':%s//gcI<left><left><left><left>')

-- keep stuff centered
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', '<leader>J', 'mzJ`z')
map('n', '<leader>K', 'kmzJ`z')

-- move lines
map('n', '<leader><c-j>', ':m .+1<cr>==')
map('n', '<leader><c-k>', ':m .-2<cr>==')
map('i', '<c-j>', '<esc>:m .+1<cr>==a')
map('i', '<c-k>', '<esc>:m .-2<cr>==a')
map('v', '<leader>j', ':m \'>+1<cr>gv=gv')
map('v', '<leader>k', ':m \'<-2<cr>gv=gv')

-- undo break points
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')
map('i', ';', ';<c-g>u')

-- comment frames
map('i', ',bl', '<esc>075i=<esc>:norm ss<cr>yypO=<esc>:norm ss<cr>30A <esc>i')
map('i', ',bm', '<esc>050i-<esc>:norm ss<cr>yypO-<esc>:norm ss<cr>20A <esc>i')
map('i', ',bs', '<esc>025i.<esc>:norm ss<cr>yypO.<esc>:norm ss<cr>10A <esc>i')

-- Scrolls
-- map('', 'J', '<c-f>')
-- map('', 'K', '<c-b>')
-- map('', 'J', '<c-f>', {noremap = false})
-- map('', 'K', '<c-b>', {noremap = false})

-- map('', 'J', '<c-d>')
-- map('', 'K', '<c-u>')
-- map('', 'J', '<c-d>', {noremap = false})
-- map('', 'K', '<c-u>', {noremap = false})

-- map('n', '<leader><cr>', ':!wc -w %<cr>')
--
-- quick browser
map('n', '<leader>tn',
    ':Telescope find_files cwd=/mnt/internal/git/system/magpie/.config/nvim<cr>')
map('n', '<leader>tc',
    ':Telescope find_files cwd=/mnt/internal/git/system/magpie/.config<cr>')

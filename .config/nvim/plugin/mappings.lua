local map = require('map')

vim.g.mapleader = ' '

-- consistancy with default mappings{{{
map('n', 'Y', 'y$')
map('n', 'V', 'v$h')
map('n', 'vv', 'V')
map('n', 'U', '<c-r>')
map('n', '<leader>v', '<c-v>')
-- }}}
-- misc essentials{{{

-- I Love My Pincky
map('i', 'kj', '<ESC>')

-- behave regularly on wrap mode
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- paste last yanked text
map('n', '<leader>p', '"0p')

-- -- better command mode
-- map('n', ':', ':<c-f>i')
-- map('c', '<esc>', '<c-c>')

-- fold management
-- map('n', '<leader>j', 'zA')

map('n', '<leader>j', 'za')
map('n', '<leader>k', 'zM')

map('n', 'u', ':silent undo<cr>')

-- -- search and replace hotkey
map('n', '<leader>R', ':%s//gcI<left><left><left><left>')

-- }}}
-- saves & quites{{{
map('n', '<cr>', ':silent! up<cr>')
--  map('n', '<leader><cr>', ':silent! exec "up | !compile % &"<cr>')
map('n', '<leader><cr>', ':silent! w !sudo tee %<cr>')
map('n', '<esc>', ':silent! up | qa<cr>')
map('n', '<leader><esc>', ':qa!<cr>')
-- }}}
-- auto pairs{{{
------------------------------------------------
-- -                   Auto Pairs 
------------------------------------------------
map('i', '\'i', '\'\'<left>')
map('i', '"i', '""<left>')
map('i', '`i', '``<left>')
map('i', '(i', '()<left>')
map('i', '{i', '{}<left>')
map('i', '[i', '[]<left>')
map('i', '<i', '<><left>')
map('i', '""i', '""""""<left><left><left>')

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
map('i', '""o', '"""<cr>"""<esc>O')
-- }}}
-- comment frames{{{

--  map('i', ',bl', '<esc>075i=<esc>:Comment<cr>yypO=<esc>:Comment<cr>30A <esc>i')
--  map('i', ',bm', '<esc>050i-<esc>:Comment<cr>yypO-<esc>:Comment<cr>20A <esc>i')
--  map('i', ',bs', '<esc>025i.<esc>:Comment<cr>yypO.<esc>:Comment<cr>10A <esc>i')

map('i', ',bl',
    '╔<esc>70a═<esc>:Comment<cr>o╚<esc>70a═<esc>:Comment<cr>O║<esc>:Comment<cr>30A <esc>a')
map('i', ',bm',
    '╔<esc>40a═<esc>:Comment<cr>o╚<esc>40a═<esc>:Comment<cr>O║<esc>:Comment<cr>20A <esc>a')
map('i', ',bs',
    '╔<esc>20a═<esc>:Comment<cr>o╚<esc>20a═<esc>:Comment<cr>O║<esc>:Comment<cr>A ')

-- }}}
-- keep stuff centered{{{
map('n', 'n', 'nzzzv') -- go to next search
map('n', 'N', 'Nzzzv') -- go to previous search
map('n', '<leader>J', 'mzJ`z') -- join the line from below
map('n', '<leader>K', 'kmzJ`z') -- join the line from above
-- }}}
-- undo break points{{{
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')
map('i', ';', ';<c-g>u')
-- }}}
-- move lines{{{
map('n', '<leader><c-j>', ':m .+1<cr>==')
map('n', '<leader><c-k>', ':m .-2<cr>==')
map('i', '<c-j>', '<esc>:m .+1<cr>==a')
map('i', '<c-k>', '<esc>:m .-2<cr>==a')
map('v', '<leader><c-j>', ':m \'>+1<cr>gv=gv')
map('v', '<leader><c-k>', ':m \'<-2<cr>gv=gv')
-- }}}
-- quickfixlist & buffer management{{{

map('n', '<tab>', ':silent! execute "bp | copen | cn | cc | cclose"<cr>')
map('n', '<s-tab>', ':silent! execute "bn | copen | cp | cc | cclose"<cr>')
map('n', '<leader><tab>', ':silent! execute "bd | cclose')
map('n', '<leader>r', 'q:icfdo %s//gcI | up<esc>F/i<c-c>')

-- }}}
-- spellings{{{
map('n', '<leader>c', '1z=')
map('n', '<leader>C', 'i<C-X><C-S>')
map('n', '<leader>a', 'zg')
map('n', '<leader>A', 'zug')
-- }}}
-- git{{{
map('n', '<leader>q', 'q:i!git add -A && git commit -m ""<esc>i<c-c>')
-- }}}
-- exp{{{
-- ===========================================================================
-- =                             Exp
-- ===========================================================================

-- saves & quites{{{
-- map('n', '<cr>', ':silent! wa<cr>')
-- map('n', '<esc>', ':silent! wa | qa<cr>')
-- }}}
-- qfixlist management{{{

-- map('n', '<tab>', '<cmd>cn<cr>')
-- map('n', '<s-tab>', '<cmd>cp<cr>')
-- map('n', '<leader><tab>', '<cmd>cclose<cr>')
-- }}}

map('n', '<leader>n', ':set rnu!<cr>')

-- map('n', '<leader>h', '<c-o>')
-- map('n', '<leader>l', '<c-i>')

-- map('n', '<leader>l', '<c-i>')

-- joins
-- map('n', '<leader>J', 'J')
-- map('n', '<leader>K', 'kJ')

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
-- }}}

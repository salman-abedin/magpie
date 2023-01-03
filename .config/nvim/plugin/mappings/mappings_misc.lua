local map = require('map')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- consistancy with default mappings
map('n', 'Y', 'y$')
map('n', 'V', 'v$h')
map('n', 'vv', 'V')
map('n', 'U', '<c-r>')
map('n', '<space>v', '<c-v>')

-- I Love My Pincky
map('i', 'kj', '<ESC>')

-- behave regularly on wrap mode
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- paste last yanked text
map('n', '<space>p', '"0p')

-- -- better command mode
-- map('n', ':', ':<c-f>i')
-- map('c', '<esc>', '<c-c>')

-- fold management
-- map('n', '<space>j', 'zA')

map('n', '<space>j', 'za')
map('n', '<space>k', 'zM')

map('n', 'u', ':silent undo<cr>')

-- -- search and replace hotkey
map('n', '<space>R', ':%s//gcI<left><left><left><left>')

-- horizontal scrolling
map('n', 'L', '40l')
map('n', 'H', '40h')

-- saves & quites
map('n', '<cr>', ':silent! up<cr>')
--  map('n', '<space><cr>', ':silent! exec "up | !compile % &"<cr>')
map('n', '<space><cr>', ':silent! w !sudo tee %<cr>')
map('n', '<esc>', ':silent! up | qa<cr>')
map('n', '<space><esc>', ':qa!<cr>')

-- keep stuff centered
map('n', 'n', 'nzzzv') -- go to next search
map('n', 'N', 'Nzzzv') -- go to previous search

-- join lines
map('n', '<space>J', 'mzJ`z') -- join the line from below
map('n', '<space>K', 'kmzJ`z') -- join the line from above

-- undo break points
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')
map('i', ';', ';<c-g>u')

-- move lines
map('n', '<c-j>', ':m .+1<cr>==')
map('n', '<c-k>', ':m .-2<cr>==')
map('i', '<c-j>', '<esc>:m .+1<cr>==a')
map('i', '<c-k>', '<esc>:m .-2<cr>==a')
map('v', '<c-j>', ':m \'>+1<cr>gv=gv')
map('v', '<c-k>', ':m \'<-2<cr>gv=gv')

-- quickfixlist & buffer management
map('n', '<tab>', ':silent! execute "bp | copen | cn | cc | cclose"<cr>')
map('n', '<s-tab>', ':silent! execute "bn | copen | cp | cc | cclose"<cr>')
map('n', '<space><tab>', ':silent! execute "bd | cclose')
map('n', '<space>r', 'q:icfdo %s//gcI | up<esc>F/i<c-c>')

-- spellings
map('n', '<space>c', '1z=')
map('n', '<space>C', 'i<C-X><C-S>')
-- map('n', '<space>a', 'zg')
-- map('n', '<space>A', 'zug')

-- git
map('n', '<space>q', 'q:i!git add -A && git commit -m ""<esc>i<c-c>')

-- ===========================================================================
-- =                             Exp
-- ===========================================================================

-- toggle relative numbers
-- map('n', '<space>n', ':set rnu!<cr>')

-- saves & quites
-- map('n', '<cr>', ':silent! wa<cr>')
-- map('n', '<esc>', ':silent! wa | qa<cr>')

-- map('n', '<tab>', '<cmd>cn<cr>')
-- map('n', '<s-tab>', '<cmd>cp<cr>')
-- map('n', '<space><tab>', '<cmd>cclose<cr>')

-- map('n', '<space>h', '<c-o>')
-- map('n', '<space>l', '<c-i>')

-- map('n', '<space>l', '<c-i>')

-- joins
-- map('n', '<space>J', 'J')
-- map('n', '<space>K', 'kJ')

-- Scrolls
-- map('', 'J', '<c-f>')
-- map('', 'K', '<c-b>')
-- map('', 'J', '<c-f>', {noremap = false})
-- map('', 'K', '<c-b>', {noremap = false})

-- map('', 'J', '<c-d>')
-- map('', 'K', '<c-u>')
-- map('', 'J', '<c-d>', {noremap = false})
-- map('', 'K', '<c-u>', {noremap = false})

-- map('n', '<space><cr>', ':!wc -w %<cr>')
--  vim.o.bg = 'light'
vim.cmd [[

autocmd VimEnter * highlight clear CursorLine
autocmd VimEnter * highlight CursorLine gui=underline

autocmd VimEnter * highlight Normal       guibg=NONE
autocmd VimEnter * highlight SignColumn   guibg=NONE
autocmd VimEnter * highlight LineNR       guibg=NONE
autocmd VimEnter * highlight CursorLineNR guibg=NONE
autocmd VimEnter * highlight EndOfBuffer  guibg=NONE
autocmd VimEnter * highlight Pmenu        guibg=NONE
autocmd VimEnter * highlight Folded       guibg=NONE
autocmd VimEnter * highlight Visual       guibg=NONE guifg=yellow gui=bold
autocmd VimEnter * highlight QuickFixLine guibg=NONE gui=bold
autocmd VimEnter * highlight SpellBad     guibg=NONE guifg=red gui=bold
autocmd VimEnter * highlight StatusLine   guibg=NONE

autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

]]

--  ===========================================================================
--  =                             Exp
--  ===========================================================================

--------------------------------------------------------------------------------
--                              Space Characters
--------------------------------------------------------------------------------

-- Visible space
-- vim.api.nvim_set_option('list', true)
-- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
-- og.listchars = 'nbsp:⦸'
-- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
-- og.listchars = a('listchars', 'tab:▷┅')

-- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
-- vim.o.listchars+=extends:»
-- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
-- vim.o.listchars+=precedes:«
-- BULLET (U+2022, UTF-8: E2 80 A2)

-- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
-- if has('linebreak') | let &showbreak='↳ ' | endif

-- vim.api.nvim_win_set_option(0, 'cursorline', true) -- show cursor line

--  " autocmd BufEnter * highlight clear SpellBad
--  ]]

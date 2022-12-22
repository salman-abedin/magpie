vim.api.nvim_set_hl(0, 'normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'endofbuffer', { bg = 'none' })
vim.api.nvim_set_hl(0, 'cursorline', { bg = 'none', underline = true })
vim.api.nvim_set_hl(0, 'visual', { bg = 'none', fg = 'yellow', bold = true })

vim.api.nvim_create_autocmd('insertenter', {
    callback = function()
        vim.api.nvim_win_set_option(0, 'cursorline', false)
    end,
})
vim.api.nvim_create_autocmd('insertleave', {
    callback = function()
        vim.api.nvim_win_set_option(0, 'cursorline', true)
    end,
})

--  ===========================================================================
--  =                             Exp
--  ===========================================================================

vim.cmd [[

" autocmd VimEnter * highlight clear SignColumn

" autocmd VimEnter * highlight clear CursorLine
" autocmd VimEnter * highlight CursorLine gui=underline

" autocmd VimEnter * highlight SignColumn   guibg=NONE
" autocmd VimEnter * highlight LineNR       guibg=NONE
" autocmd VimEnter * highlight CursorLineNR guibg=NONE
" autocmd VimEnter * highlight Pmenu        guibg=NONE
" autocmd VimEnter * highlight Folded       guibg=NONE
" autocmd VimEnter * highlight Visual       guibg=NONE guifg=yellow gui=bold
" autocmd VimEnter * highlight QuickFixLine guibg=NONE gui=bold
" autocmd VimEnter * highlight SpellBad     guibg=NONE guifg=red gui=bold
" autocmd VimEnter * highlight StatusLine   guibg=NONE

]]

--  vim.o.bg = 'light'

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

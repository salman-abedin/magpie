vim.cmd [[

	"  restore cursor position
	autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

	" Custom filetypes
	autocmd BufNewFile,BufRead calcurse-note.* setlocal filetype=markdown
	autocmd BufNewFile,BufRead *.astro setlocal filetype=astro
	autocmd BufNewFile,BufRead *.tmux setlocal filetype=tmux

	" Spell
	"  autocmd BufNewFile,BufRead *.md setlocal spell
    autocmd FileType mail,markdown setlocal spell
    autocmd FileType mail setlocal wrap

	" MQL
	autocmd BufNewFile,BufRead *.mq{4,h} setlocal commentstring=//%s

    autocmd FileType expect setlocal commentstring=#%s

]]

--  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='Visual', timeout=200 }
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank {higroup = 'Visual'}
    end,
    pattern = '*'
})

-- ===========================================================================
-- =                             Exp
-- ===========================================================================

-- vim.cmd [[
-- " Auto splits for toying around
-- " autocmd VimEnter toy.* silent !tmux split-window -l 35\% \; last-pane
-- " autocmd VimLeave toy.* !tmux killp -t :.+

-- " Saves & Loads folds
-- " autocmd VimLeave ?* mkview
-- " autocmd VimLeave ?* silent! loadview
-- " autocmd BufUnload * mkview
-- " autocmd BufReadPost ?* silent! loadview

--  "  " Auto rename tmux window
--  "  autocmd BufReadPost * silent! !tmux-rename-window %

-- ]]

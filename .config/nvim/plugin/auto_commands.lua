vim.cmd [[

	" restore cursor position
	autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

	" Highlight yanked lines
	autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='Visual', timeout=200 }

	"  " Auto rename tmux window
	"  autocmd BufReadPost * silent! !tmux-rename-window %

	" Custom filetypes
	autocmd BufNewFile,BufRead calcurse-note.* setlocal filetype=markdown
	autocmd BufNewFile,BufRead *.astro setlocal filetype=astro
	autocmd BufNewFile,BufRead *.tmux setlocal filetype=tmux

	" Spell
	autocmd BufNewFile,BufRead *.md setlocal spell

	" MQL
	autocmd BufNewFile,BufRead *.mq{4,h} setlocal commentstring=//%s

    autocmd FileType expect setlocal commentstring=#%s

]]

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

-- ]]

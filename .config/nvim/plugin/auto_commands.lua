vim.cmd [[

	" restore cursor position
	autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

	" Auto splits for toying around
	autocmd VimEnter toy.* silent !tmux split-window -l 35\% \; last-pane

	" Auto rename tmux window
	autocmd BufEnter * silent! !tmux-rename-window %

	" Kills the output pane of toys on quit
	autocmd VimLeave toy.* !tmux killp -t :.+

	" Highlight yanked lines
	autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='Visual', timeout=200 }

	" Custom filetypes
	autocmd BufNewFile,BufRead calcurse-note.* setfiletype markdown
	autocmd VimEnter *.astro set filetype=astro

	" Maintain one single buffer at all times
	" autocmd BufCreate * silent! execute 'up | %bd | e# | bd#'

	" Maintain one single tab at all times
	autocmd TabEnter * silent! execute 'tabonly | up | %bd'

	" Saves & Loads folds
	" autocmd VimLeave ?* mkview
	" autocmd VimLeave ?* silent! loadview
	" autocmd BufUnload * mkview
	" autocmd BufReadPost ?* silent! loadview

]]

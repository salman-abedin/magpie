vim.cmd [[
" Saves & Loads folds
autocmd VimLeave ?* mkview
autocmd VimEnter ?* silent! loadview

" Auto splits for toying around
autocmd VimEnter toy.* silent !tmux split-window -l 35\% \; last-pane

" Kills the output pane of toys on quit
autocmd VimLeave toy.* !tmux killp -t :.+

" Highlight yanked lines
autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='Visual', timeout=200 }

" Maintain one single buffer at all times
autocmd BufCreate * silent! execute "up | %bd | e# | bd#"

" Custom filetypes
autocmd BufNewFile,BufRead calcurse-note.* setfiletype markdown
autocmd VimEnter *.astro set filetype=astro

]]

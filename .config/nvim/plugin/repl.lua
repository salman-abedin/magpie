vim.cmd [[
  " autocmd BufWritePost toy.js silent!  1sleep | terminal node %
  " autocmd BufRead toy.js nnoremap <cr> :1sleep \| terminal node %<cr>

 " autocmd BufRead toy.php nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> terminal php % <cr>
 " autocmd BufRead toy.java nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> terminal javac % && java Main<cr>
 " autocmd BufRead graph.js nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> 1sleep <bar> terminal node % <cr>
 " autocmd BufRead fetch.js nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> 1sleep <bar> terminal node % <cr>

 autocmd BufRead toy.java nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> 1sleep <bar> terminal javac % && java Main <cr>
 autocmd BufRead toy.rb nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> 1sleep <bar> terminal ruby % <cr>
 autocmd BufRead toy.lua nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> 1sleep <bar> terminal lua % <cr>
 autocmd BufRead toy.pl nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> 1sleep <bar> terminal perl % <cr>
 autocmd BufRead toy.sh nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> 1sleep <bar> terminal sh % <cr>
 autocmd BufRead toy.bash nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> terminal bash % <cr>
 autocmd BufRead toy.js nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> 2sleep <bar> terminal node % <cr>
 autocmd BufRead *toys/python/*.{py,pyw} nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> 1sleep <bar> terminal python % <cr>
 autocmd BufRead *toys/php/*.php nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> 1sleep <bar> terminal php % <cr>

 autocmd BufWritePost mq4.py silent !python %  &

 "  autocmd BufRead *infoimage/db/*.py nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> 1sleep <bar> terminal python % <cr>
 " autocmd BufRead *infoimage/db/*.py nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> 1sleep <bar> terminal python % > /tmp/ii_db && vim /tmp/ii_db <cr>
 autocmd BufRead *infoimage/db/*.py nnoremap <silent> <cr> :silent up \| 1sleep \| silent! execute '!python % > /tmp/ii_db' \| e /tmp/ii_db<cr>

 autocmd BufRead *toys/rust/src/main.rs nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> 1sleep <bar> terminal cargo run <cr>

]]

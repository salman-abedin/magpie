vim.cmd [[
  " autocmd BufWritePost toy.js silent!  1sleep | terminal node %
  " autocmd BufRead toy.js nnoremap <cr> :1sleep \| terminal node %<cr>

 autocmd BufRead toy.php nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> terminal php % <cr>
 autocmd BufRead toy.java nnoremap <silent> <cr> :silent up <bar> silent! %bd! <bar> e# <bar> bd# <bar> terminal javac % && java Main<cr>

]]

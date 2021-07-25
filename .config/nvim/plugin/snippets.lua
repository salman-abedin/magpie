-- javascript{{{
----------------------------------------
--               Javascript
----------------------------------------
vim.cmd [[
autocmd FileType javascript,vue,pug,svelte inoremap ,A (async () => {<cr>})();<esc>O
autocmd FileType javascript,vue,pug,svelte inoremap ,a () => {<cr>}<esc>k$F)i
autocmd FileType javascript,vue,pug,svelte inoremap ,c case :<cr>break;<up><left>
autocmd FileType javascript,vue,pug,svelte inoremap ,E export default () => {<cr>}<esc>O
autocmd FileType javascript,vue,pug,svelte inoremap ,ei else if () {<cr>}<up><right><right><right>
autocmd FileType javascript,vue,pug,svelte inoremap ,el else {<cr>}<up><right><right><right>
autocmd FileType javascript,vue,pug,svelte inoremap ,f function () {<cr>}<esc>k$F)i
autocmd FileType javascript,vue,pug,svelte inoremap ,i if () {<cr>}<up><right><right><right>
autocmd FileType javascript,vue,pug,svelte inoremap ,I import * from '<++>'<esc>F*s
autocmd FileType javascript,vue,pug,svelte inoremap ,l console.log()<Left>
autocmd FileType javascript,vue,pug,svelte inoremap ,L console.dir(, { depth: null })<esc>F(a
autocmd FileType javascript,vue,pug,svelte inoremap ,o () => ({<cr>})<esc>k$F)i
autocmd FileType javascript,vue,pug,svelte inoremap ,s switch () {<cr>}<up><esc>f(a
autocmd FileType javascript,vue,pug,svelte inoremap ,tc try{<cr>}catch (error){<cr><++><cr>}<esc>2kO

]]
-- }}}
-- sass{{{
-- ----------------------------------------
-- --               Sass
-- ----------------------------------------
vim.cmd [[
" autocmd VimEnter *.sass setlocal shiftwidth=2
autocmd VimEnter *.{sass,vue,svelte} inoremap ,dg  display: grid<cr>
autocmd VimEnter *.{sass,vue,svelte} inoremap ,pic place-items: center<cr>
autocmd VimEnter *.{sass,vue,svelte} inoremap ,m @media (min-width: 601px)<cr><tab>
autocmd VimEnter *.{sass,vue,svelte} inoremap ,c calc()<left>

autocmd VimEnter *.{sass,vue,svelte} inoremap ,pr position: relative<esc>o
autocmd VimEnter *.{sass,vue,svelte} inoremap ,pa position: absolute<esc>o
]]
-- }}}

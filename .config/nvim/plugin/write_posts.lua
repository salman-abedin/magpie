vim.cmd [[
" toys (setup for easily messing around with various programming languages)
" autocmd BufWritePost toy.* silent !toy %
" Auto compile
autocmd BufWritePost *.{ms,c,h,mq4} silent !compile % > /dev/null 2>&1 &
autocmd FileType sh autocmd BufWritePost * silent !compile %

autocmd BufWritePost fcronrc silent !fcrontab %
autocmd BufWritePost boltrc  silent !bolt -g

autocmd BufWritePost *.tmux silent !tmux source ~/.config/tmux/tmux.conf

autocmd BufWritePost */qtile/config.py silent !xdotool key super+q
" autocmd BufWritePost *.dfa silent !xdotool key super+l key alt+f+1 key super+l

" autocmd BufWritePost .{bash,input,vim}rc silent !for server in jump:~ rht:~; do scp % $server &; done
autocmd BufWritePost *_process*,frstls1.sh silent !rsync -aP % dsi:/z/salmanA/tmp &
" autocmd BufWritePost  silent !rsync -aP % dsi:/z/salman/tmp &

]]

-- utils.vimscript [[
-- 
-- "==========================================================================
-- "                 Configs (Automatic Reload/Refresh)
-- "==========================================================================
-- 
-- autocmd BufWritePost init.lua     PackerCompile
-- 
-- autocmd BufWritePost *xmodmap*    silent !xmodmap %
-- autocmd BufWritePost gebaard.toml silent !pkill -USR1 gebaard
-- autocmd BufWritePost compton.conf silent !pkill -USR1 compton
-- autocmd BufWritePost dunstrc
--          \ silent !killall dunst && dunst & notify-send -i "$ICONS"/bell.png 'Head' 'Message'
-- autocmd BufWritePost */dwm/config.def.h silent !pkill dwm
-- 
-- "==========================================================================
-- "                             Devs
-- "==========================================================================
-- 
-- " Auto compile
-- autocmd BufWritePost *.{ms,c,h}
--        \ silent !compile %
-- autocmd FileType sh
--       \ autocmd BufWritePost <buffer>
--       \ silent !compile %
-- 
-- " toys (setup for easily messing around with various programming languages)
-- autocmd BufWritePost toy.* !toy %
-- 
-- " Insert semicolons (yeah, I am that lazy. XD)
-- autocmd BufWritePost nginx.conf, *.css
--          \ exec "norm! ma" |
--          \ %s/[^{};]$/&;/e |
--          \ exec "norm! `a"
-- 
-- ]]

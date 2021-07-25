vim.cmd [[
" command Con cd /mnt/internal/git/system/magpie/.config | Telescope find_files

command! Con Telescope find_files cwd=/mnt/internal/git/system/magpie/.config
command! Scr Telescope find_files cwd=/mnt/internal/git/system/alfred/src
command! Den Telescope find_files cwd=/mnt/internal/git/work/denim/src
command! Tzc Telescope find_files cwd=/mnt/internal/git/work/3ZC/src

]]

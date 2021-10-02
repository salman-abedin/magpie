if not pcall(require, 'telescope') then return end

-- ===========================================================================
-- =                             Config 
-- ===========================================================================

require('telescope').setup {
  defaults = {
    file_ignore_patterns = {'node_modules/.*', '%.env', '%.lock', '%.astro'},
    mappings = {i = {['kj'] = 'close', ['<ESC>'] = 'close'}}
  },

  pickers = {
    find_files = {
      layout_config = {prompt_position = 'top'},
      sorting_strategy = 'ascending',
      previewer = false,
      mappings = {
        i = {
          [';'] = 'select_tab',
          [':'] = 'select_default'
          -- [':'] = 'select_horizontal',
        }
        -- i = {[';'] = 'select_default', ['kj'] = 'close', ['<ESC>'] = 'close'}
      }
      -- theme = 'dropdown'
      -- theme = 'ivy'
      -- hidden = true
    },

    live_grep = {theme = 'ivy', mappings = {i = {[';'] = 'send_to_qflist'}}}

  }
}
require('telescope').load_extension('fzy_native')

vim.cmd [[
	" Maintain one single tab at all times
	autocmd TabEnter * silent! execute 'tabonly | wa | %bd' | call setqflist([])

	" Maintain one single buffer at all times
	" autocmd BufCreate * silent! execute 'wa | %bd | e# | bd#'
]]

-- ===========================================================================
-- =                             Mappings 
-- ===========================================================================

local map = require('map')

map('n', '<leader>f', '<cmd>Telescope find_files<cr>')
map('n', '<leader>/', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>?', '<cmd>Telescope live_grep grep_open_files=true<cr>')
map('n', '<leader>b', '<cmd>Telescope buffers<cr>')
-- map('n', '<leader>F', '<cmd>Telescope file_browser<cr>')

-- quick browser
map('n', '<leader>tc',
    ':Telescope find_files cwd=/mnt/internal/git/system/magpie/.config/nvim<cr>')
map('n', '<leader>td',
    ':Telescope find_files cwd=/mnt/internal/git/system/magpie/.config<cr>')
map('n', '<leader>tn',
    ':Telescope find_files cwd=/mnt/internal/git/daily/notes<cr>')
map('n', '<leader>tm',
    ':Telescope find_files cwd=/mnt/internal/git/work/denim/src<cr>')

-- custom commands

vim.cmd [[
" command Con cd /mnt/internal/git/system/magpie/.config | Telescope find_files

command! Con Telescope find_files cwd=/mnt/internal/git/system/magpie/.config
command! Scr Telescope find_files cwd=/mnt/internal/git/system/alfred/src
command! Den Telescope find_files cwd=/mnt/internal/git/work/denim/src
command! Tzc Telescope find_files cwd=/mnt/internal/git/work/3ZC/src

]]

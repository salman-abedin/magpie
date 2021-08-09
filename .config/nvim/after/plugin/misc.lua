local map = require('utils').map

vim.g.emmet_html5 = 0
vim.g.user_emmet_leader_key = ','

vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_use_treesitter = true
-- vim.g.indent_blankline_filetype = {'pug', 'python'}
-- vim.g.indent_blankline_char = '┊'
-- vim.g.indent_blankline_enabled = false


if pcall(require, 'neoscroll') then
  require('neoscroll').setup()
  require('neoscroll.config').set_mappings {
    J = {'scroll', {'vim.api.nvim_win_get_height(0)', 'false', '250'}},
    K = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'false', '250'}}
  }
end

if pcall(require, 'hop') then
  require'hop'.setup {quit_key = ';'}
  map('n', 'e', '<cmd>lua require\'hop\'.hint_words()<cr>', {noremap = false})
  map('v', 'e', '<cmd>lua require\'hop\'.hint_words()<cr>', {noremap = false})
  map('n', 'E', '<cmd>lua require\'hop\'.hint_char1()<cr>', {noremap = false})
  map('v', 'E', '<cmd>lua require\'hop\'.hint_char1()<cr>', {noremap = false})
end

if pcall(require, 'commented') then
  require('commented').setup {
    keybindings = {n = 's', v = 's', nl = 'ss'},
    hooks = {
      before_comment = require('ts_context_commentstring.internal').update_commentstring
    }
  }
end


-- if pcall(require, 'colorizer') then
  -- require'colorizer'.setup {'sass', 'svelte', 'vue', 'css', 'scss'}
-- end

-- if pcall(require, 'nvim-web-devicons') then
-- require'nvim-web-devicons'.setup {
-- -- override = {zsh = {icon = '', color = '#428850', name = 'Zsh'}},
-- default = true
-- }
-- end

-- if pcall(require, 'scrollbar') then
-- vim.cmd [[
-- autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
-- autocmd WinEnter,FocusGained * silent! lua require('scrollbar').show()
-- autocmd WinLeave,FocusLost * silent! lua require('scrollbar').clear()
-- ]]
-- end

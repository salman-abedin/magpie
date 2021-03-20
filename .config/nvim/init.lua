-- logo{{{
--                               _
--    ____   ___   ____  _   __ (_)____ ___
--   / __ \ / _ \ / __ \| | / // // __ `__ \
--  / / / //  __// /_/ /| |/ // // / / / / /
-- /_/ /_/ \___/ \____/ |___//_//_/ /_/ /_/
--}}}
-- variables & functions{{{
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.python_host_prog = '/usr/bin/python2'

local f = vim.fn
local g = vim.g

local function m(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function r(option, exclusion)
   return vim.api.nvim_get_option(option):gsub("," .. exclusion, "")
end

local function a(option, inclusion)
   return vim.api.nvim_get_option(option) .. inclusion
end

local function set_options(global, window, buffer)

   for key, value in pairs(global) do
      vim.api.nvim_set_option(key, value)
   end

   for key, value in pairs(window) do
      vim.api.nvim_win_set_option(0, key, value)
   end

   for key, value in pairs(buffer) do
      vim.api.nvim_buf_set_option(0, key, value)
   end

end

local function run_commands(commands)
   for command in commands:gmatch("([^\n]*)\n?") do
      vim.cmd(command)
   end
end

-- }}}
-- plugins{{{
-- bootstrap{{{
local execute = vim.api.nvim_command

local install_path = f.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if f.empty(f.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end
--}}}
require('packer').startup(function()
   use {'wbthomason/packer.nvim'}
   use { 'neovim/nvim-lspconfig' }

   use { 'tpope/vim-surround' }
   m('n', 'S', 'ys', { noremap = false})

   -- use { 'hrsh7th/nvim-compe' }

   -- colorschemes{{{
   use {'rakr/vim-one'}
   use {'NLKNguyen/papercolor-theme'}
   vim.api.nvim_set_option('bg', 'dark')
   vim.cmd('colorscheme one')
--}}}
   -- commenting{{{
   use 'tyru/caw.vim'
   use 'Shougo/context_filetype.vim'
   m('', 's', 'gcc', { noremap = false})
--}}}
   -- smoothie{{{
   use {'psliwka/vim-smoothie'}
   m( '', 'K', '<Plug>(SmoothieUpwards)', { noremap = false})
   m( '', 'J', '<Plug>(SmoothieDownwards)', { noremap = false})
--}}}
   -- easymotion{{{
   use { 'easymotion/vim-easymotion' }
   g.EasyMotion_do_mapping = 0
   g.EasyMotion_smartcase = 1
   m( 'n', 'e', '<Plug>(easymotion-overwin-w)', { noremap = false})
--}}}
-- emmete{{{
use { 'mattn/emmet-vim'}
g.emmet_html5 = 0
g.user_emmet_leader_key=','
g.user_emmet_install_global = 0
vim.cmd('autocmd FileType html,css,sass,javascript,pug,vue EmmetInstall')
--}}}
   -- indent line{{{
   use { 'Yggdroot/indentLine' }
   g.indentLine_char = '┊'
--}}}
   -- syntax{{{
   use { 'pangloss/vim-javascript' }
   use { 'posva/vim-vue' }
   use { 'digitaltoad/vim-pug' }
--}}}
-- lsp{{{
local lsp = require'lspconfig'

lsp.tsserver.setup{}
lsp.bashls.setup{}
lsp.clangd.setup{}

lsp.cssls.setup{
   filetypes = { "css", "sass" },
   settings = { css = { validate = true }, sass = { validate = true }, }
}

   -- lua{{{
   USER = vim.fn.expand('$USER')

   local sumneko_root_path = ""
   local sumneko_binary = ""

   if vim.fn.has("mac") == 1 then
      sumneko_root_path = "/Users/" .. USER .. "/.config/nvim/lua-language-server"
      sumneko_binary = "/Users/" .. USER .. "/.config/nvim/lua-language-server/bin/macOS/lua-language-server"
   elseif vim.fn.has("unix") == 1 then
      sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
      sumneko_binary = "/home/" .. USER .. "/.config/nvim/lua-language-server/bin/Linux/lua-language-server"
   else
      print("Unsupported system for sumneko")
   end

   require'lspconfig'.sumneko_lua.setup {
      cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
      settings = {
         Lua = {
               runtime = {
                  -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                  version = 'LuaJIT',
                  -- Setup your lua path
                  path = vim.split(package.path, ';')
               },
               diagnostics = {
                  -- Get the language server to recognize the `vim` global
                  globals = {'vim'}
               },
               workspace = {
                  -- Make the server aware of Neovim runtime files
                  library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
               }
         }
      }
   }
--}}}

--}}}
end)
--}}}
-- options{{{

global = {

encoding = 'utf-8',

----------------------------------------
--              Essentials 
----------------------------------------

autoread  = true,           -- reload files if changed
hidden = true,              -- allow buffers with unsaved changes
backup = false,             -- disable backups
writebackup = false,              -- disable writebackup
swapfile = false,           -- disable swap
autoindent = true,                 -- match indents new lines with previous line.
smartindent     = true,           -- see help. XD
clipboard = 'unnamedplus',      -- copy to system clipboards
updatetime = 300,             -- buffer update / Cursor hold autocommand delay
undofile = true,                  -- allows undo after closing and reopening a file
autochdir = true,                  -- change project directory to selected buffer path
backspace = 'indent,eol,start', -- Enable proper backspace behavior

pumheight = 5,                -- Makes popup menu smaller

----------------------------------------
--              Searching 
----------------------------------------

ignorecase = true, -- case insensitive search
smartcase = true,  -- if there are uppercase letters, become case-sensitive.
incsearch = true,  -- live incremental searching
showmatch = true,  -- live match highlighting
wrapscan = true,   -- searching wraps lines
hlsearch = false, -- dont highlight matches


ruler = false,     -- dont show file position in the bottom right
showmode = false,  -- dont show current mode
showcmd = false,   -- dont show partial cmd in the last line
modelines = 0, -- disable modelines
laststatus = 0, -- disable status line

----------------------------------------
--              Tabs 
----------------------------------------

expandtab = true,     -- use spaces instead of tabs.
shiftround = true,    -- always indent by multiple of shiftwidth
smarttab = true,      -- <tab>/<BS> indent/dedent in leading whitespace

----------------------------------------
--              Misc 
----------------------------------------

magic = true,                 -- respect regx characters while searching
history = 100,           -- the number of histories to record for various operations
lazyredraw = true,            -- whether to redraw screen after macros
formatoptions = a('formatoptions', 'n'),

shell = '/usr/bin/zsh',    -- prefer zsh for shell-related tasks
-- vim.o.iskeyo.d-=_          -- exclude characters from text object
sidescroll = 0,          -- sidescroll in jumps because terminals are slow
spellfile = '~/.config/nvim/spell/en.utf-8.add', -- spell file path


}

window = {
   foldmethod = 'marker',
   -- signcolumn = 'yes',
   -- fdo = r('fdo', 'search'),
}

buffer = {
   softtabstop = 3, -- spaces per tab (in insert mode)
   shiftwidth = 3,  -- spaces per tab (when shifting)
   tabstop = 3,     -- number of spaces per tab
}

set_options(global, window, buffer)

-- print(vim.wo.signcolumn)

--}}}
-- theme{{{

vim.api.nvim_set_option('termguicolors', true)     -- use guibg syntax
vim.api.nvim_win_set_option(0, 'cursorline', true) -- show cursor line

commands_theme = [[

" cursor
autocmd VimEnter * highlight clear CursorLine
autocmd VimEnter * highlight CursorLine gui=underline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

" transparency
autocmd VimEnter * highlight Normal guibg=NONE
autocmd VimEnter * highlight SignColumn guibg=NONE
autocmd VimEnter * highlight Folded guibg=NONE
autocmd VimEnter * highlight Visual guibg=NONE guifg=#00FF00

]]
run_commands(commands_theme)

-- exp{{{
vim.cmd([[
" Transparency
" highlight CursorLineNR  guibg=NONE
" highlight LineNR        guibg=NONE
" highlight EndOfBuffer   guibg=NONE

" highlight Pmenu         guibg=NONE
" highlight CocErrorHighlight guibg=NONE guifg=red

" Miss-spelled colors
" highlight clear SpellBad
" highlight SpellBad guibg=NONE guifg=Red
]])
--}}}
--
--==============================================================================
--                             Space characters 
--==============================================================================



--Visible space
vim.api.nvim_set_option('list', true)
-- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
-- og.listchars = 'nbsp:⦸'
-- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
-- og.listchars = a('listchars', 'tab:▷┅')


-- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
-- vim.o.listchars+=extends:»
-- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
-- vim.o.listchars+=precedes:«
-- BULLET (U+2022, UTF-8: E2 80 A2)

-- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
-- if has('linebreak') | let &showbreak='↳ ' | endif

--==============================================================================
--                             Misc 
--==============================================================================

vim.api.nvim_set_option('emoji', false) -- don't assume all emoji are double width
--}}}
-- mappings{{{

vim.g.mapleader = ' '

m('n', 'gj', '<c-i>')
m('n', 'gk', '<c-o>')

-- auto pairs{{{
m('i', "'i", "''<left>")
m('i', '"i', '""<left>')
m('i', '`i', '``<left>')

m('i', "'a", "''")
m('i', '"a', '""')
m('i', '`a', '``')

m('i', "'o", "'<cr>'<esc>o")
m('i', '"o', '"<cr>"<esc>o')
m('i', '`o', '`<cr>`<esc>o')
--}}}
-- consistancy with default mappings{{{
m('n', 'Y', 'y$')
m('n', 'V', 'v$h')
m('n', 'vv', 'V')
m('n', 'U', '<c-r>')
m('n', '<leader>v', '<c-v>')
--}}}

m('n', '<cr>', ':silent wa<cr>', { silent = true })
m('n', '<esc>', ':wqa<cr>', { silent = true })
m('n', '<leader><esc>', ':qa!<cr>', { silent = true })

-- folds
m('n', '<leader>j', 'za')
m('n', '<leader>k', 'zm')

-- joins
m('n', '<leader>J', 'J')
m('n', '<leader>K', 'kJ')

m('n', 'u', ':silent undo<cr>', { silent = true })
m('n', '<leader>s', ':%s//gcI<left><left><left><left>')

--}}}
-- auto commands{{{
commands_auto = [[

" Save & Load folds
autocmd VimEnter ?* silent! loadview
autocmd VimLeave * mkview

" Auto split for toying around
autocmd VimEnter toy.* silent !tmux split-window -l 35\% \; last-pane

" Kill the output pane of toys on quit
autocmd VimLeave toy.* !tmux killp -t :.+

]]
run_commands(commands_auto)

-- vim.cmd([[

-- 
-- " Updates the buffer if changed elsewhere
-- autocmd FocusGained,BufEnter * checktime
-- 
-- " Restore cursor to the last location
-- autocmd BufReadPost * call setpos(".", getpos("'\""))
-- 
-- " Disables automatic commenting on newline:
-- autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
-- 
-- " Rename tmux window
-- " autocmd VimEnter * silent !tmux-rename-window %
-- 
-- 
-- 
-- " Clean Junk files after quitting
-- autocmd VimLeave *.tex !compile --clean %
-- 
-- 
-- ]])
-- 
-- --}}}
-- write posts{{{
commands_posts = [[
" toys (setup for easily messing around with various programming languages)
autocmd BufWritePost toy.* !toy %
]]
run_commands(commands_posts)

-- vim.cmd([[
-- 
-- "===============================================================================
-- "                 Configs (Automatic Reload/Refresh)
-- "===============================================================================
-- 
-- autocmd BufWritePost init.lua     PackerCompile
-- 
-- autocmd BufWritePost *xmodmap*    silent !xmodmap %
-- autocmd BufWritePost gebaard.toml silent !pkill -USR1 gebaard
-- autocmd BufWritePost compton.conf silent !pkill -USR1 compton
-- autocmd BufWritePost fcronrc      silent !fcrontab %
-- autocmd BufWritePost boltrc       silent !bolt -g
-- autocmd BufWritePost dunstrc
--          \ silent !killall dunst && dunst & notify-send -i "$ICONS"/bell.png 'Head' 'Message'
-- autocmd BufWritePost tmux.conf
--          \ silent !tmux source ~/.config/tmux/tmux.conf
-- 
-- autocmd BufWritePost */dwm/config.def.h silent !pkill dwm
-- 
-- "===============================================================================
-- "                             Devs
-- "===============================================================================
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
-- ]])
-- --}}}

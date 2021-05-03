-- logo{{{
--                               _
--    ____   ___   ____  _   __ (_)____ ___
--   / __ \ / _ \ / __ \| | / // // __ `__ \
--  / / / //  __// /_/ /| |/ // // / / / / /
-- /_/ /_/ \___/ \____/ |___//_//_/ /_/ /_/
-- }}}
-- variables & functions{{{
--------------------------------------------------------------------------------
--                              Variables & Functions
--------------------------------------------------------------------------------
-- betters health
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.python_host_prog = '/usr/bin/python2'

local f = vim.fn
local g = vim.g

-- g.vim_json_conceal = 0

local function m(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- local function r(option, exclusion)
--    return vim.api.nvim_get_option(option):gsub(',' .. exclusion, '')
-- end
-- 
-- local function a(option, inclusion)
--    return vim.api.nvim_get_option(option) .. inclusion
-- end

local function set_options(global, window, buffer)

  for key, value in pairs(global) do vim.api.nvim_set_option(key, value) end

  for key, value in pairs(window) do vim.api.nvim_win_set_option(0, key, value) end

  for key, value in pairs(buffer) do vim.api.nvim_buf_set_option(0, key, value) end

end

local function vimscript(commands)
  for command in commands:gmatch('([^\n]*)\n?') do vim.cmd(command) end
end

-- }}}

-- =============================================================================
--                              Plugins
-- =============================================================================

-- bootstrap{{{
----------------------------------------
--               Packer Bootstrap
----------------------------------------
local execute = vim.api.nvim_command

local install_path = f.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if f.empty(f.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
              install_path)
  execute 'packadd packer.nvim'
end

require('packer').startup(function()

  -- }}}
  -- completion{{{
  ----------------------------------------
  --               Completion
  ----------------------------------------

  -- use 'nvim-lua/completion-nvim'
  -- g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
  -- vimscript [[ autocmd BufEnter * lua require'completion'.on_attach() ]]
  -- g.completion_confirm_key = '<c-y>'
  -- vimscript [[ autocmd VimEnter * lua require'completion'.on_attach() ]]

  -- m('i', '<tab>', 'pumvisible() ? "<C-n><C-y>" : "<Tab>"', {expr = true})
  -- m('i', '<s-tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', {expr = true})

  m('i', '<tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', {expr = true})
  m('i', '<s-tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', {expr = true})
  m('i', '<CR>', 'pumvisible() ? "<C-y>" : "<CR>"', {expr = true})

  -- use 'hrsh7th/nvim-compe '
  -- require'compe'.setup {
  --   enabled = true,
  --   autocomplete = true,
  --   debug = false,
  --   min_length = 1,
  --   preselect = 'enable',
  --   throttle_time = 80,
  --   source_timeout = 200,
  --   incomplete_delay = 400,
  --   max_abbr_width = 100,
  --   max_kind_width = 100,
  --   max_menu_width = 100,
  --   documentation = true,
  --   source = {
  --     path = true,
  --     buffer = true,
  --     calc = true,
  --     nvim_lsp = true,
  --     nvim_lua = true,
  --     vsnip = true
  --   }
  -- }

  -- }}}
  -- colorschemes{{{
  ----------------------------------------
  --               Colorschemes
  ----------------------------------------
  vim.api.nvim_set_option('bg', 'dark')
  vim.api.nvim_set_option('termguicolors', true)

  -- use 'tjdevries/colorbuddy.vim'
  -- use 'Th3Whit3Wolf/onebuddy'
  -- require('colorbuddy').colorscheme('onebuddy')

  use {'Yggdroot/indentLine'}
  g.indentLine_char = '┊'

  use 'mhartington/oceanic-next'
  vimscript 'colorscheme OceanicNext'

  -- use {'NLKNguyen/papercolor-theme'}
  -- use {'rakr/vim-one'}
  -- vimscript('colorscheme one')

  -- use 'Th3Whit3Wolf/space-nvim'
  -- vimscript('colorscheme space-nvim')

  -- use 'sainnhe/sonokai'
  -- vimscript('colorscheme sonokai')

  -- use 'tanvirtin/monokai.nvim'
  -- vimscript('colorscheme monokai')

  -- use 'Th3Whit3Wolf/one-nvim'
  -- vimscript('colorscheme one-nvim')

  -- use 'sainnhe/edge'
  -- vimscript('colorscheme edge')

  -- use 'norcalli/nvim-base16.lua'
  -- local base16 = require 'base16'
  -- local one_dark = base16.theme_from_array {
  --    '282C34', 'E06C75', '98C379', 'E5C07B', '61AFEF', 'C678DD', '56B6C2',
  --    'ABB2BF', '282C34', 'E06C75', '98C379', 'E5C07B', '61AFEF', 'C678DD',
  --    '56B6C2', 'ABB2BF'
  -- }
  -- base16(one_dark, true)

  -- use 'RRethy/nvim-base16'
  -- local colorscheme = require('base16-colorscheme')
  -- colorscheme.setup('monokai')

  -- }}}
  -- commenting{{{
  ----------------------------------------
  --               Commenting
  ----------------------------------------

  use 'tyru/caw.vim'
  use 'Shougo/context_filetype.vim'
  m('', 's', 'gcc', {noremap = false})

  -- use 'b3nj5m1n/kommentary'
  -- require('kommentary.config').configure_language('default', {
  --    prefer_single_line_comments = true
  --    -- use_consistent_indentation = true,
  --    -- ignore_whitespace = true
  -- })

  -- m('n', 's', 'gc', {noremap = false})
  -- m('v', 's', 'gc<esc>', {noremap = false})
  -- m('n', 'ss', 'gcc', {noremap = false})

  -- }}}
  -- smoothie{{{
  use 'psliwka/vim-smoothie'
  m('', 'K', '<Plug>(SmoothieUpwards)', {noremap = false})
  m('', 'J', '<Plug>(SmoothieDownwards)', {noremap = false})
  -- }}}
  -- emmete{{{
  use 'mattn/emmet-vim'
  g.emmet_html5 = 0
  g.user_emmet_leader_key = ','
  g.user_emmet_install_global = 0
  vimscript 'autocmd FileType html,css,sass,javascript,pug,vue EmmetInstall'
  -- }}}
  -- -- indent guide{{{
  -- use 'glepnir/indent-guides.nvim'
  -- require('indent_guides').setup({
  --   indent_start_level = 2,
  --   indent_soft_pattern = '┊',
  --   exclude_filetypes = {'help'}
  -- })
  -- -- }}}
  -- syntax{{{
  -- use {'pangloss/vim-javascript'}
  -- use {'posva/vim-vue'}
  use {'digitaltoad/vim-pug'}
  -- }}}
  -- colorizer{{{
  use 'norcalli/nvim-colorizer.lua'
  require'colorizer'.setup {'sass'}
  -- }}}
  -- hop{{{
  use 'phaazon/hop.nvim'
  -- require'hop'.setup {keys = 'fjdksl', term_seq_bias = 0.5}
  m('n', 'e', '<cmd>lua require\'hop\'.hint_words()<cr>', {noremap = false})
  -- }}}
  -- scrollbar{{{
  use 'Xuyuanp/scrollbar.nvim'
  vimscript [[
   autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
   autocmd WinEnter,FocusGained * silent! lua require('scrollbar').show()
   autocmd WinLeave,FocusLost             * silent! lua require('scrollbar').clear()
   ]]
  -- }}}
  -- tree sitter{{{
  ----------------------------------------
  --               Tree Sitter
  ----------------------------------------
  use {'nvim-treesitter/nvim-treesitter', run = '<cmd>TSUpdate'}
  use 'p00f/nvim-ts-rainbow'
  require'nvim-treesitter.configs'.setup {
    ensure_installed = 'all',
    highlight = {enable = true},
    -- highlight = {enable = false},
    -- autotag = {enable = true}
    rainbow = {enable = true},
    indent = {enable = true}
  }
  -- }}}
  --   -- lsps{{{
  --   ----------------------------------------
  --   --               LSP
  --   ----------------------------------------
  --   use 'neovim/nvim-lspconfig'
  --   -- config{{{
  --   --------------------
  --   --       Config
  --   --------------------
  --   vim.lsp.handlers['textDocument/publishDiagnostics'] =
  --       vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  --         virtual_text = false,
  --         --  see: ":help vim.lsp.diagnostic.set_signs()"
  --         signs = false
  --       })
  -- 
  --   vimscript [[
  -- 
  -- " autocmd VimEnter * highlight LspDiagnosticsUnderlineInformation guibg=NONE guifg=green gui=bold
  -- " autocmd VimEnter * highlight LspDiagnosticsFloatingInformation guibg=NONE guifg=green gui=bold
  -- 
  -- autocmd VimEnter * highlight LspDiagnosticsUnderlineHint guibg=none guifg=green gui=bold
  -- autocmd VimEnter * highlight LspDiagnosticsFloatingHint guibg=none guifg=green gui=bold
  -- 
  -- autocmd VimEnter * highlight LspDiagnosticsUnderlineWarning guibg=none guifg=yellow gui=bold
  -- autocmd VimEnter * highlight LspDiagnosticsFloatingWarning guibg=none guifg=yellow gui=bold
  -- 
  -- autocmd VimEnter * highlight LspDiagnosticsUnderlineError guibg=none guifg=red gui=bold
  -- autocmd VimEnter * highlight LspDiagnosticsFloatingError guibg=none guifg=red gui=bold
  --    ]]
  -- 
  --   m('n', 'gj', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>')
  --   m('n', 'gk', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>')
  --   -- }}}
  --   -- languages{{{
  --   --------------------
  --   --       Languages
  --   --------------------
  --   lsp = require 'lspconfig'
  --   lsp.bashls.setup {settings = {documentFormatting = false}}
  --   lsp.clangd.setup {settings = {documentFormatting = false}}
  --   lsp.tsserver.setup {settings = {documentFormatting = false}}
  --   lsp.vuels.setup {settings = {documentFormatting = false}}
  -- 
  --   -- lsp.cssls.setup {
  --   --    filetypes = {'css', 'sass'},
  --   --    settings = {css = {validate = true}, sass = {validate = true}}
  --   -- }
  --   -- }}}
  --   -- }}}
  --   -- efm lsp{{{
  --   -- -------------------------------------
  --   --               EFM LSP
  --   -- -------------------------------------
  --   local lua_format = {
  --     formatCommand = 'lua-format --indent-width 2 --double-quote-to-single-quote'
  --   }
  -- 
  --   local shellcheck = {
  --     LintCommand = 'shellcheck -f gcc -x',
  --     lintFormats = {
  --       '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'
  --     }
  --   }
  --   local shfmt = {formatCommand = 'shfmt -i 2 -ci -s -sr -bn'}
  -- 
  --   local prettier = {formatCommand = 'prettier --tab-width 2'}
  --   local prettier_javascript = {
  --     formatCommand = 'prettier --single-quote --tab-width 2'
  --   }
  -- 
  --   lsp.efm.setup {
  --     init_options = {documentFormatting = true, codeAction = false},
  --     filetypes = {
  --       'sh', 'lua', 'markdown', 'javascript', 'yaml', 'json', 'html', 'css',
  --       'vue'
  --     },
  --     settings = {
  --       rootMarkers = {'.git/'},
  --       languages = {
  --         lua = {lua_format},
  --         sh = {shellcheck, shfmt},
  --         html = {prettier},
  --         css = {prettier},
  --         vue = {prettier_javascript},
  --         javascript = {prettier_javascript},
  --         json = {prettier},
  --         yaml = {prettier},
  --         markdown = {prettier}
  --       }
  --     }
  --   }
  -- 
  --   vimscript [[
  -- autocmd FileType sh,markdown autocmd BufWritePre * silent lua vim.lsp.buf.formatting()
  -- autocmd BufWritePre *.{lua,js,css,html,yaml,vue,json} silent lua vim.lsp.buf.formatting()
  -- 	]]
  -- 
  --   -- }}}
  -- misc{{{
  -- -------------------------------------
  --               Misc
  -- -------------------------------------
  use 'wbthomason/packer.nvim'
  -- use {
  --    'nvim-telescope/telescope.nvim',
  --    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  -- }

  use 'neoclide/coc.nvim'

end)
-- }}}

-- =============================================================================
--                              Config
-- =============================================================================

-- options{{{
--------------------------------------------------------------------------------
--                              Options
--------------------------------------------------------------------------------

----------------------------------------
--               Globals
----------------------------------------
global = {

  -- encoding = 'utf-8',

  -- autoread = true, -- reload files if changed
  hidden = true, -- allow buffers with unsaved changes
  backup = false, -- disable backups
  writebackup = false, -- disable writebackup
  swapfile = false, -- disable swap
  -- autoindent = true, -- match indents new lines with previous line.
  smartindent = true, -- see help. XD
  clipboard = 'unnamedplus', -- copy to system clipboards
  updatetime = 300, -- buffer update / Cursor hold autocommand delay
  -- undofile = true, -- allows undo after closing and reopening a file
  autochdir = true, -- change project directory to selected buffer path
  -- backspace = 'indent,eol,start', -- Enable proper backspace behavior

  pumheight = 5, -- Makes popup menu smaller

  ignorecase = true, -- case insensitive search
  smartcase = true, -- if there are uppercase letters, become case-sensitive.
  incsearch = true, -- live incremental searching
  showmatch = true, -- live match highlighting
  wrapscan = true, -- searching wraps lines
  hlsearch = false, -- dont highlight matches

  ruler = false, -- dont show file position in the bottom right
  showmode = false, -- dont show current mode
  showcmd = false, -- dont show partial cmd in the last line
  modelines = 0, -- disable modelines
  laststatus = 0, -- disable status line

  -- expandtab = true, -- use spaces instead of tabs.
  shiftround = true, -- always indent by multiple of shiftwidth
  -- smarttab = true, -- <tab>/<BS> indent/dedent in leading whitespace

  magic = true, -- respect regx characters while searching
  history = 100, -- the number of histories to record for various operations
  lazyredraw = true, -- whether to redraw screen after macros

  -- vim.o.iskeyo.d-=_          -- exclude characters from text object
  sidescroll = 0, -- sidescroll in jumps because terminals are slow
  spellfile = '~/.config/nvim/spell/en.utf-8.add', -- spell file path

  -- Set completeopt to have a better completion experience
  -- completeopt = 'menuone,noselect,noinsert',
  completeopt = 'menuone,noselect',

  -- Avoid showing message extra message when using completion
  shortmess = vim.o.shortmess .. 'c',

  -- Start scrolling at an offset from the bottom
  scrolloff = 999,

  -- Disable Safe Write
  backupcopy = 'yes',

  -- Don't let Vim's 'Found a swap file' message block input
  shortmess = vim.o.shortmess .. 'A'
}

----------------------------------------
--               Window
----------------------------------------
window = {
  foldmethod = 'marker',

  -- Never show the sign column (i.e. no more jerking)
  -- signcolumn = 'no',
  signcolumn = 'yes',

  -- fdo = r('fdo', 'search'),

  -- Set absolute line numbers
  number = true,

  -- Set relative line numbers
  relativenumber = true,

  -- Disable folding at startup
  foldlevel = 99,

  -- Disable line wrapping
  wrap = false
}

----------------------------------------
--               Buffer
----------------------------------------
buffer = {
  softtabstop = 2, -- spaces per tab (in insert mode)
  shiftwidth = 2, -- spaces per tab (when shifting)
  tabstop = 2 -- number of spaces per tab
}

set_options(global, window, buffer)
-- vimscript [[set iskeyword-=_]]
-- vimscript [[set shortmess+=c]]

-- print(vim.wo.signcolumn)

-- }}}
-- theme{{{
--------------------------------------------------------------------------------
--                              Themes
--------------------------------------------------------------------------------

vim.api.nvim_win_set_option(0, 'cursorline', true) -- show cursor line

vimscript [[

" cursor
autocmd VimEnter * highlight clear CursorLine
autocmd VimEnter * highlight clear SpellBad

autocmd VimEnter * highlight CursorLine gui=underline

autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline


" transparency
autocmd VimEnter * highlight Normal       guibg=NONE
autocmd VimEnter * highlight SignColumn   guibg=NONE
autocmd VimEnter * highlight Folded       guibg=NONE
autocmd VimEnter * highlight Pmenu        guibg=NONE
autocmd VimEnter * highlight EndOfBuffer  guibg=NONE
autocmd VimEnter * highlight LineNR       guibg=NONE
autocmd VimEnter * highlight CursorLineNR guibg=NONE
autocmd VimEnter * highlight Visual       guibg=NONE guifg=yellow gui=bold
autocmd VimEnter * highlight SpellBad     guibg=NONE guifg=red gui=bold
]]

--------------------------------------------------------------------------------
--                              Space Characgters
--------------------------------------------------------------------------------

-- Visible space
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

-- ==============================================================================
--                             Misc 
-- ==============================================================================

vim.api.nvim_set_option('emoji', false) -- don't assume all emoji are double width
-- }}}
-- mappings{{{
--------------------------------------------------------------------------------
--                              Mappings
--------------------------------------------------------------------------------

vim.g.mapleader = ' '

-- auto pairs{{{
m('i', '\'i', '\'\'<left>')
m('i', '"i', '""<left>')
m('i', '`i', '``<left>')
m('i', '(i', '()<left>')
m('i', '{i', '{}<left>')
m('i', '[i', '[]<left>')
m('i', '<i', '<><left>')

m('i', '\'a', '\'\'')
m('i', '"a', '""')
m('i', '`a', '``')
m('i', '(a', '()')
m('i', '{a', '{}')
m('i', '[a', '[]')
m('i', '<a', '<>')

m('i', '\'o', '\'<cr>\'<esc>O')
m('i', '"o', '"<cr>"<esc>O')
m('i', '`o', '`<cr>`<esc>O')
m('i', '(o', '(<cr>)<esc>O')
m('i', '{o', '{<cr>}<esc>O')
m('i', '[o', '[<cr>]<esc>O')
-- }}}
-- consistancy with default mappings{{{
m('n', 'Y', 'y$')
m('n', 'V', 'v$h')
m('n', 'vv', 'V')
m('n', 'U', '<c-r>')
m('n', '<leader>v', '<c-v>')
-- }}}

-- m('n', 'gj', '<c-i>')
-- m('n', 'gk', '<c-o>')

m('n', '<cr>', ':silent wa<cr>', {silent = true})
-- m('n', '<cr>', '<cmd>silent wa<cr>', {silent = true})
m('n', '<esc>', '<cmd>wqa<cr>', {silent = true})
m('n', '<leader><esc>', '<cmd>qa!<cr>', {silent = true})

-- paste last yanked text
m('n', '<leader>p', '"0p')

-- folds
-- m('n', '<leader>j', 'zA')
m('n', '<leader>j', 'za')
m('n', '<leader>k', 'zM')

-- joins
m('n', '<leader>J', 'J')
m('n', '<leader>K', 'kJ')

-- spellings
m('n', '<leader>f', '1z=')
m('n', '<leader>F', 'i<C-X><C-S>')
m('n', '<leader>a', 'zg')
m('n', '<leader>A', 'zug')

m('n', 'u', '<cmd>silent undo<cr>', {silent = true})
m('n', '<leader>s', ':%s//gcI<left><left><left><left>')

-- }}}
-- auto commands{{{
--------------------------------------------------------------------------------
--                              Autocommands
--------------------------------------------------------------------------------
vimscript [[

" Saves & Loads folds
" autocmd VimLeave ?* mkview
" autocmd VimEnter ?* silent! loadview

" Auto splits for toying around
autocmd VimEnter toy.* silent !tmux split-window -l 35\% \; last-pane

" Kills the output pane of toys on quit
autocmd VimLeave toy.* !tmux killp -t :.+

" disables auto comments
autocmd VimEnter * set formatoptions-=cro

" enable undoing between buffer closes
autocmd VimEnter * set undofile

" Updates the buffer if changed elsewhere
autocmd FocusGained,BufEnter * checktime

" Restore cursor to the last location
autocmd BufReadPost * call setpos(".", getpos("'\""))

" Rename tmux window
autocmd VimEnter ?* silent !tmux-rename-window %

" Highlight yanked lines
autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='Visual', timeout=200 }

" Use spaces instead of tabs
autocmd VimEnter * set expandtab
]]
-- --}}}
-- write posts{{{
--------------------------------------------------------------------------------
--                              Write Posts
--------------------------------------------------------------------------------
vimscript [[
" toys (setup for easily messing around with various programming languages)
autocmd BufWritePost toy.* silent !toy %
" Auto compile
autocmd BufWritePost *.{ms,c,h} silent !compile %
autocmd FileType sh autocmd BufWritePost * silent !compile %

autocmd BufWritePost fcronrc silent !fcrontab %
autocmd BufWritePost boltrc  silent !bolt -g

autocmd BufWritePost tmux.conf silent !tmux source ~/.config/tmux/tmux.conf

]]

-- vimscript [[
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
-- autocmd BufWritePost dunstrc
--          \ silent !killall dunst && dunst & notify-send -i "$ICONS"/bell.png 'Head' 'Message'
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
-- ]]
-- --}}}
-- language specifics{{{
--------------------------------------------------------------------------------
--                              Language Specifics
--------------------------------------------------------------------------------
-- filetypes{{{
----------------------------------------
--               Filetypes
----------------------------------------
vimscript [[
autocmd BufNewFile,BufRead calcurse-note.* setfiletype markdown
]]
-- }}}
-- lua{{{
----------------------------------------
--               Lua
----------------------------------------
vimscript [[
autocmd FileType lua inoremap ;bl -- <esc>77a=<esc>yypO-- <esc>29a<space><Esc>i<RIGHT>
autocmd FileType lua inoremap ;bm -- <esc>37a-<esc>yypO-- <esc>14a<space><Esc>i<RIGHT>
autocmd FileType lua inoremap ;bs -- <esc>17a-<esc>yypO-- <esc>7a<space><Esc>i<RIGHT>
]]
-- }}}
-- markdown{{{
--------------------------------------
--              Markdown
--------------------------------------
vimscript [[
autocmd FileType markdown autocmd VimEnter * setlocal spell
autocmd FileType markdown inoremap ;bl <esc>i<!--<ESC>76a=<ESC>o<ESC>77i=<ESC>a--><ESC><<O<ESC>30a<SPACE><ESC>a
autocmd FileType markdown inoremap inoremap ;bm <esc>i<!--<ESC>28a=<ESC>o<ESC>29i=<ESC>a--><ESC><<O<ESC>15a<SPACE><ESC>a
]]
-- }}}
-- shellscript{{{
-- -------------------------------------
--               Shellscript
-- -------------------------------------
vimscript [[
" Enable Tree Sitter Code Folding
autocmd FileType sh set foldmethod=expr
autocmd FileType sh set foldexpr=nvim_treesitter#foldexpr()
]]
-- }}}
-- javascript{{{
----------------------------------------
--               Javascript
----------------------------------------
vimscript [[
autocmd FileType javascript,vue,pug inoremap ;A (async () => {<cr>})();<esc>O
autocmd FileType javascript,vue,pug inoremap ;a () => {<cr>}<esc>k$F)i
autocmd FileType javascript,vue,pug inoremap ;c case :<cr>break;<up><left>
autocmd FileType javascript,vue,pug inoremap ;E export default () => {<cr>}<esc>O
autocmd FileType javascript,vue,pug inoremap ;ei else if () {<cr>}<up><right><right><right>
autocmd FileType javascript,vue,pug inoremap ;el else {<cr>}<up><right><right><right>
autocmd FileType javascript,vue,pug inoremap ;f function () {<cr>}<esc>k$F)i
autocmd FileType javascript,vue,pug inoremap ;i if () {<cr>}<up><right><right><right>
autocmd FileType javascript,vue,pug inoremap ;I import * from '<++>'<esc>F*s
autocmd FileType javascript,vue,pug inoremap ;l console.log()<Left>
autocmd FileType javascript,vue,pug inoremap ;L console.dir(, { depth: null })<esc>F(a
autocmd FileType javascript,vue,pug inoremap ;o () => ({<cr>})<esc>k$F)i
autocmd FileType javascript,vue,pug inoremap ;s switch () {<cr>}<up><esc>f(a
autocmd FileType javascript,vue,pug inoremap ;tc try{<cr>}catch (error){<cr><++><cr>}<esc>2kO

]]
-- }}}
-- sass{{{
-- ----------------------------------------
-- --               Sass
-- ----------------------------------------
vimscript [[
" autocmd VimEnter *.sass setlocal shiftwidth=2
autocmd VimEnter *.{sass,vue} inoremap ;dg  display: grid<cr>
autocmd VimEnter *.{sass,vue} inoremap ;pic place-items: center<cr>
autocmd VimEnter *.{sass,vue} inoremap ;m @media (min-width: 601px)<cr><tab>
autocmd VimEnter *.{sass,vue} inoremap ;c calc()<left>
]]
-- }}}
-- vue{{{
-- -------------------------------------
--               Vue
-- -------------------------------------
vimscript [[
" Enable Tree Sitter Code Folding
autocmd FileType vue set foldmethod=expr
autocmd FileType vue set foldexpr=nvim_treesitter#foldexpr()
]]
-- }}}
-- misc{{{
----------------------------------------
--               Headers
----------------------------------------
vimscript [[
autocmd FileType sh,conf,yaml,sxhkd,zsh,python,muttrc,tmux,make,nginx inoremap ;bl #<esc>79a=<esc>yypO#<esc>30a<space><Esc>i<RIGHT>
autocmd FileType sh,conf,yaml,sxhkd,zsh,python,muttrc,tmux,make,nginx inoremap ;bm #<esc>39a-<esc>yypO#<esc>15a<space><Esc>i<RIGHT>
autocmd FileType sh,conf,yaml,sxhkd,zsh,python,muttrc,tmux,make,nginx inoremap ;bs #<esc>19a-<esc>yypO#<esc>7a<space><Esc>i<RIGHT>

autocmd FileType c,cpp,dart,javascript,php,typescript,pug,sass,java inoremap ;bl //<esc>78a=<esc>yypO//<esc>30a<space><Esc>i<RIGHT>
autocmd FileType c,cpp,dart,javascript,php,typescript,pug,sass,java inoremap ;bm //<esc>38a-<esc>yypO//<esc>15a<space><Esc>i<RIGHT>
autocmd FileType c,cpp,dart,javascript,php,typescript,pug,sass,java inoremap ;bs //<esc>18a-<esc>yypO//<esc>7a<space><Esc>i<RIGHT>

autocmd FileType mail,json autocmd VimEnter * setlocal spell
]]
-- }}}
-- }}}
-- experiments{{{
--------------------------------------------------------------------------------
--                              Experiments
--------------------------------------------------------------------------------
-- lsp{{{
-- vimscript [[
-- sign define LspDiagnosticsSignHint text=ℹ texthl= linehl= numhl=
-- sign define LspDiagnosticsSignWarning text=⚠ texthl= linehl= numhl=
-- sign define LspDiagnosticsSignError text=❌ texthl= linehl= numhl=
-- autocmd VimEnter * highlight LspDiagnosticsVirtualTextHint guibg=NONE guifg=green gui=bold
-- autocmd VimEnter * highlight LspDiagnosticsVirtualTextWarning guibg=NONE guifg=yellow gui=bold
-- autocmd VimEnter * highlight LspDiagnosticsVirtualTextError guibg=NONE guifg=red gui=bold
-- ]]

-- }}}
-- spellsitter{{{
-- use 'lewis6991/spellsitter.nvim'
-- require('spellsitter').setup {
--    hl = 'SpellBad',
--    captures = {}, -- set to {} to spellcheck everything
--    hunspell_cmd = 'hunspell',
--    hunspell_args = {}
-- }
-- }}}
-- -- easymotion{{{
-- use {'easymotion/vim-easymotion'}
-- g.EasyMotion_do_mapping = 0
-- g.EasyMotion_smartcase = 1
-- m('n', 'e', '<Plug>(easymotion-overwin-w)', {noremap = false})
-- -- }}}
-- indentline{{{
-- use {'Yggdroot/indentLine'}
-- g.indentLine_char = '┊'
-- }}}
-- }}}
-- qalam{{{
-- =============================================================================
--                              Qalam(For Arabic Writing)
-- =============================================================================
qalam_on = 0
function qalam()
  if qalam_on == 0 then
    vim.api.nvim_win_set_option(0, 'spell', true)
    vim.api.nvim_win_set_option(0, 'rightleft', true)
    vim.api.nvim_set_option('delcombine', true)

    m('i', 'a', 'أ')
    -- m('i', 'A', 'ََ')

    m('i', ';a', 'ا')
    m('i', "'a", 'ء')

    m('i', ';A', 'ئ')

    m('i', 'aa', 'آ')

    m('i', 'b', 'ب')
    m('i', 't', 'ت')
    m('i', 'th', 'ث')
    m('i', 'j', 'ج')
    m('i', 'H', 'ح')
    m('i', 'kh', 'خ')
    m('i', 'd', 'د')
    m('i', 'dh', 'ذ')
    m('i', 'r', 'ر')
    m('i', 'zh', 'ز')
    m('i', 's', 'س')
    m('i', 'sh', 'ش')
    m('i', 'S', 'ص')
    m('i', 'D', 'ض')
    m('i', 'T', 'ط')
    m('i', 'z', 'ظ')
    m('i', 'e', 'ع')
    m('i', 'g', 'غ')
    m('i', 'f', 'ف')
    m('i', 'k', 'ك')
    m('i', 'K', 'ق')
    m('i', 'l', 'ل')
    m('i', 'm', 'م')
    m('i', 'n', 'ن')
    m('i', 'h', 'ه')
    m('i', 'w', 'و')
    m('i', 'y', 'ي')
    m('i', 'Y', 'ى')
    m('i', 'i', 'إ')
    m('i', 'I', 'ِ')
    m('i', 'u', 'أ')
    m('i', 'U', 'ُ')
    m('i', ';t', 'ة')
    m('i', '?', '؟')

    m('i', '1', '١')
    m('i', '2', '٢')
    m('i', '3', '٣')
    m('i', '4', '٤')
    m('i', '5', '٥')
    m('i', '6', '٦')
    m('i', '7', '٧')
    m('i', '8', '٨')
    m('i', '9', '٩')
    m('i', '0', '٠')

    m('i', '(', '﴾')
    m('i', ')', '﴿')

    m('i', ',', '،')
    m('i', ';;', '؛')
    m('i', '.', '۔')

    qalam_on = 1
    print('Turned qalam on')
  else
    vim.api.nvim_win_set_option(0, 'spell', false)

    vim.api.nvim_win_set_option(0, 'rightleft', false)
    vim.api.nvim_set_option('delcombine', false)

    qalam_on = 0
    print('Turned qalam off')
  end
end
vimscript [[ autocmd BufReadPost *.ar.* lua qalam() ]]
m('n', 'ga', '<cmd>lua qalam()<cr>', {silent = true})
-- }}}

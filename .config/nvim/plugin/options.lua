local set_options = function(global, window, buffer)
  for key, value in pairs(global) do vim.api.nvim_set_option(key, value) end

  for key, value in pairs(window) do vim.api.nvim_win_set_option(0, key, value) end

  for key, value in pairs(buffer) do vim.api.nvim_buf_set_option(0, key, value) end
end

local remove = function(option, exclusion)
  return vim.api.nvim_get_option(option):gsub(',' .. exclusion, '')
end

local add = function(option, inclusion)
  return vim.api.nvim_get_option(option) .. inclusion
end

vim.opt.iskeyword = vim.opt.iskeyword - '_' -- exclude underscore from keyword

-- Prevent annoying messages
vim.opt.shortmess = vim.opt.shortmess + 'c' -- Completion
+ 'A' -- Swap
+ 'W' -- Written
+ 'o' -- Overwrite
+ 'O' -- file-read
+ 'a' -- Abbreviation
+ 'I' -- Splash Screen
+ 'T' -- non-file
+ 't' -- Startup

-- ===========================================================================
-- =                             Buffers 
-- ===========================================================================

buffer = {

  expandtab = true, -- Use spaces instead of tabs
  undofile = true, -- enable undoing between buffer closes

  softtabstop = 2, -- spaces per tab (in insert mode)
  shiftwidth = 2, -- spaces per tab (when shifting)
  tabstop = 2 -- number of spaces per tab

  -- backspace = 'indent,eol,start', -- Enable proper backspace behavior
  -- smarttab = true, -- <tab>/<BS> indent/dedent in leading whitespace
  -- autoindent = true, -- match indents new lines with previous line.
}

-- ===========================================================================
-- =                             Window 
-- ===========================================================================
window = {
  foldmethod = 'marker', -- User markers for folding
  signcolumn = 'yes', -- Always show the sign column (i.e. no more jerking)
  number = true, -- Set absolute line numbers
  relativenumber = true, -- Set relative line numbers

  cursorline = true, -- Show cursor line

  wrap = false, -- Disable line wrapping

  linebreak = true, -- break lines consistantly
  breakindent = true -- break indents consistantly

  -- list = true, -- show whitespace
  -- foldlevel = 99, -- Disable folding at startup
}

-- ===========================================================================
-- =                             Globals 
-- ===========================================================================

global = {
  -- don't autoinsert two spaces after '.', '?', '!' for join command
  joinspaces = false,

  pumblend = 10, -- pseudo-transparency for popup-menu

  equalalways = false, -- I don't like my windows changing all the time

  showbreak = string.rep(' ', 3), -- Make it so that long lines wrap smartly

  cindent = true, -- see help

  textwidth = 80, -- automatically hard wrap at 80 columns

  autoread = true, -- reload files if changed
  swapfile = false, -- disable swap
  spellfile = '~/.config/nvim/spell/en.utf-8.add', -- spell file path

  backupcopy = 'yes', -- Disable Safe Write

  smartindent = true, -- see help. XD

  spellcapcheck = '', -- don't check for capital letters at start of sentence
  synmaxcol = 200, -- don't bother syntax highlighting long lines

  -- foldopen = 'all', -- always open folds in need

  history = 100, -- the number of histories to record for various operations
  showcmd = false, -- dont show partial cmd in the last line
  wrapscan = true, -- searching wraps lines
  clipboard = 'unnamedplus', -- copy to system clipboards
  emoji = false, -- don't assume all emoji are double width
  magic = true, -- respect regx characters while searching
  scrolloff = 999, -- Start scrolling at an offset from the bottom
  updatetime = 1000, -- buffer update / Cursor hold autocommand delay
  showmode = false, -- dont show current mode
  showmatch = true, -- live match highlighting
  pumheight = 5, -- Makes popup menu smaller
  hlsearch = false, -- dont highlight matches
  shiftround = true, -- always indent by multiple of shiftwidth
  lazyredraw = true, -- whether to redraw screen after macros
  sidescroll = 0, -- sidescroll in jumps because terminals are slow
  backup = false, -- disable backups
  ruler = false, -- dont show file position in the bottom right
  smartcase = true, -- if there are uppercase letters, become case-sensitive.
  incsearch = true, -- live incremental searching
  hidden = true, -- allow buffer switching without saving
  ignorecase = true, -- case insensitive search
  viewoptions = 'cursor,folds', -- {mk/load}view just these
  updatecount = 0, -- update swapfiles every 0 typed chars
  modelines = 0, -- disable modelines
  writebackup = false, -- don't keep backups after writing

  termguicolors = true,

  expandtab = true, -- Use spaces instead of tabs
  undofile = true, -- enable undoing between buffer closes

  softtabstop = 2, -- spaces per tab (in insert mode)
  shiftwidth = 2, -- spaces per tab (when shifting)
  tabstop = 2, -- number of spaces per tab

  laststatus = 0 -- disable status line

  -- statusline = '%#rainbowcol3#' -- set color
  -- -- filename
  -- .. '📁 %f' .. '%=' -- go to right
  -- .. '📖 %L' -- total lines count
  -- .. '  | ' -- seperator
  -- .. '🍨 %{&filetype}' -- filetype
  -- .. ' | ' -- seperator
  -- .. '🎁 %{&fileencoding?&fileencoding:&encoding}' -- encoding
  -- .. '',

  -- fdo = remove('fdo', 'search'),

  -- wildoptions = 'pum',
  -- autochdir = true, -- change project directory to selected buffer path

}

set_options(global, window, buffer)

-- vim.opt.listchars = {
--   -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
--   nbsp = '⦸',
--   -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
--   extends = '»',
--   -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
--   precedes = '«',
--   -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + MIDLINE HORIZONTAL ELLIPSIS (U+22EF, UTF-8: E2 8B AF)
--   tab = '▷⋯',
--   -- BULLET (U+2022, UTF-8: E2 80 A2)
--   trail = '•'
-- }

-- vim.opt.fillchars = {
--   -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
--   diff = '∙',
--   -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0) to suppress ~ at EndOfBuffer
--   eob = ' ',
--   -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
--   fold = '·',
--   -- BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
--   vert = '┃'
-- }

-- vim.opt.wildmode = vim.opt.wildmode - 'list' + 'longest' + 'full'
-- print(vim.o.filetype)

local set_options = function(global, window, buffer)
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

    --  wrap = false, -- Disable line wrapping

    foldlevel = 99, -- Disable folding at startup

    linebreak = true, -- break lines consistantly
    breakindent = true -- break indents consistantly

    -- list = true, -- show whitespace
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
    tabstop = 2 -- number of spaces per tab

    --  statusline = '%L' -- set color

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

vim.opt.listchars = {
    nbsp = '⦸',
    extends = '»',
    precedes = '«',
    tab = '▷⋯',
    trail = '•'
}

vim.opt.fillchars = {diff = '∙', eob = ' ', fold = '·', vert = '┃'}

-- vim.opt.wildmode = vim.opt.wildmode - 'list' + 'longest' + 'full'
--  print(vim.wo.fillchars)

-- ===========================================================================
-- =                             Packer 
-- ===========================================================================
-- bootstrap{{{
------------------------------------------------
-- -                   BootStrap 
------------------------------------------------
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data') ..
                         '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
              install_path)
  execute 'packadd packer.nvim'
end
-- }}}

if not pcall(require, 'packer') then return end

require('packer').startup(function()
  -- essentials{{{
  ------------------------------------------------
  -- -                   Essentials 
  ------------------------------------------------
  use {
    'mhartington/oceanic-next',
    config = 'vim.cmd[[colorscheme OceanicNext]]'
  }
  -- treesitter
  use {'nvim-treesitter/nvim-treesitter', run = '<cmd>TSUpdate'}
  use {'p00f/nvim-ts-rainbow', requires = 'nvim-treesitter/nvim-treesitter'}
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    requires = 'nvim-treesitter/nvim-treesitter'
  }
  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim'
    }
  }

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'winston0410/commented.nvim'
  use 'phaazon/hop.nvim'
  use 'karb94/neoscroll.nvim'
  -- }}}
  -- misc{{{
  ------------------------------------------------
  -- -                   Misc 
  ------------------------------------------------
  use {'mattn/emmet-vim', ft = {'html', 'svelte', 'astro', 'vue'}}
  use {'lukas-reineke/indent-blankline.nvim', ft = {'pug', 'python'}}
  use {
    'norcalli/nvim-colorizer.lua',
    ft = {'sass', 'svelte', 'vue', 'css', 'scss'}
  }

  -- syntax
  use 'pangloss/vim-javascript'
  use 'evanleck/vim-svelte'
  use 'posva/vim-vue'
  use 'digitaltoad/vim-pug'

  use 'wbthomason/packer.nvim'
  -- }}}
  -- experiments{{{
  -- =========================================================================  
  -- =                             Experiements 
  -- =========================================================================  

  -- colorschemes{{{
  ------------------------------------------------
  -- -                   ColorSchemes 
  ------------------------------------------------

  -- use {
  -- 'Th3Whit3Wolf/onebuddy',
  -- requires = 'tjdevries/colorbuddy.vim',
  -- config = 'require(\'colorbuddy\').colorscheme(\'onebuddy\')'
  -- }

  -- use {
  -- 'sainnhe/gruvbox-material',
  -- config = 'vim.cmd[[colorscheme gruvbox-material]]'
  -- }

  -- use {'NLKNguyen/papercolor-theme'}

  -- use {'rakr/vim-one'}
  -- vim.cmd('colorscheme one')

  -- use 'Th3Whit3Wolf/space-nvim'
  -- vim.cmd('colorscheme space-nvim')

  -- use 'sainnhe/sonokai'
  -- vim.cmd('colorscheme sonokai')

  -- use 'tanvirtin/monokai.nvim'
  -- vim.cmd('colorscheme monokai')

  -- use 'Th3Whit3Wolf/one-nvim'
  -- vim.cmd('colorscheme one-nvim')

  -- use 'sainnhe/edge'
  -- vim.cmd('colorscheme edge')

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

  -- use {'tjdevries/express_line.nvim', requires = 'nvim-lua/plenary.nvim'}

  -- use 'Xuyuanp/scrollbar.nvim'
  -- use 'kyazdani42/nvim-web-devicons'
  -- use 'neoclide/coc.nvim'
  -- use 'nvim-lua/completion-nvim'
  -- use {
  -- 'ibhagwan/fzf-lua',
  -- requires = {'vijaymarupudi/nvim-fzf', 'kyazdani42/nvim-web-devicons'}
  -- }

  -- use {'lukas-reineke/indent-blankline.nvim', ft = {'svelte', 'vue'}}

  -- use 'tyru/caw.vim'
  -- use 'Shougo/context_filetype.vim'
  -- map('', 's', 'gcc', {noremap = false})

  -- use 'b3nj5m1n/kommentary'
  -- require('kommentary.config').configure_language('default', {
  --   prefer_single_line_comments = true
  --   -- use_consistent_indentation = true,
  --   -- ignore_whitespace = true
  -- })
  -- map('v', 's', 'gc<esc>', {noremap = false})
  -- map('n', 's', 'gc', {noremap = false})
  -- map('n', 'ss', 'gcc', {noremap = false})

  -- }}}
end)

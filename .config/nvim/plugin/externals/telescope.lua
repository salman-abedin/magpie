if not pcall(require, 'telescope') then return end

require('telescope').setup {
  defaults = {
    layout_config = {prompt_position = 'top'},
    sorting_strategy = 'ascending',
    mappings = {
      i = {[';'] = 'select_default', ['kj'] = 'close', ['<ESC>'] = 'close'}
    }
  },
  pickers = {
    find_files = {
      -- theme = 'dropdown'
      -- theme = 'ivy'
      -- hidden = true
    }
  }
}
require('telescope').load_extension('fzy_native')

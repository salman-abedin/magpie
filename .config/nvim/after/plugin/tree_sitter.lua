if not pcall(require, 'nvim-treesitter') then
    return
end

require'nvim-treesitter.configs'.setup {
    --  ensure_installed = 'all',
    --  sync_install = false,

    auto_install = true,

    --  textobjects = {
    --  select = {
    --  enable = true,
    --  -- Automatically jump forward to textobj, similar to targets.vim 
    --  lookahead = true,
    --  keymaps = {
    --  ["af"] = "@function.outer",
    --  ["if"] = "@function.inner",
    --  ["ac"] = "@class.outer",
    --  ["ic"] = "@class.inner",
    --  ["iF"] = {
    --  python = "(function_definition) @function",
    --  cpp = "(function_definition) @function",
    --  c = "(function_definition) @function",
    --  java = "(method_declaration) @function",
    --  },
    --  },
    --  },
    --  },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
        --  disable = {'c', 'cpp', 'markdown'},
    },
    indent = {enable = true}
    -- autotag = {enable = true}
}

if not pcall(require, 'nvim-biscuits') then
    return
end

require('nvim-biscuits').setup {
    default_config = {
        max_length = 12,
        min_distance = 5,
        prefix_string = ' 📎 '
    }

    --  language_config = {
    --  html = {
    --  prefix_string = " 🌐 "
    --  },
    --  javascript = {
    --  prefix_string = " ✨ ",
    --  max_length = 80
    --  },
    --  python = {
    --  disabled = true
    --  }
    --  }

}

-- Enable treesitter folding
--  vim.cmd [[
--  " autocmd FileType sh,c,cpp,vue setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
--  ]]


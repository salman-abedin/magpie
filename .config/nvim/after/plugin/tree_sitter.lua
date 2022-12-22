if pcall(require, 'nvim-treesitter') then
    require'nvim-treesitter.configs'.setup {
        auto_install = true,
        --  ensure_installed = 'all',
        --  sync_install = false,


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
end


if pcall(require, 'nvim-biscuits') then
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
end

-- Enable treesitter folding
--  vim.cmd [[
--  " autocmd FileType sh,c,cpp,vue setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
--  ]]

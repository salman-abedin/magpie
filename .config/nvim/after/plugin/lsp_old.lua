if pcall(require, 'mason') then
    require('mason').setup()
end

--  init{{{
if not pcall(require, 'lspconfig') then
    return
end
local map = require('map')
-- }}}
-- config{{{
-- ===========================================================================
-- =                             Config
-- ===========================================================================

-- vim.lsp.handlers['textDocument/publishDiagnostics'] =
--     vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--         --  see: ":help vim.lsp.diagnostic.set_signs()"
--         --  virtual_text = false
--         -- update_in_insert = true
--         -- signs = false
--     })

local lsp = require 'lspconfig'

lsp.bashls.setup {
    on_attach = function(client)
        client.server_capabilities.document_formatting = false
    end
}

-- lsp.clangd.setup {
--     on_attach = function(client)
--         client.server_capabilities.document_formatting = false
--     end
-- }

-- lsp.tsserver.setup {
--     on_attach = function(client)
--         client.server_capabilities.document_formatting = false
--     end,
--
--     root_dir = function()
--         return vim.loop.cwd()
--     end
--
-- }
--
-- lsp.solargraph.setup {}

-- lsp.html.setup {
--     on_attach = function(client)
--         client.server_capabilities.document_formatting = false
--     end
-- }

-- lsp.cssls.setup {
--     on_attach = function(client)
--         client.server_capabilities.document_formatting = false
--     end,
--     filetypes = {'css', 'sass'},
--     settings = {sass = {validate = true}}
-- }

--  lsp.stylelint_lsp.setup {
--  on_attach = function(client)
--  client.server_capabilities.document_formatting = false
--  end
--  }

-- lsp.pylsp.setup {
--     --  on_attach = function(client)
--     --  client.server_capabilities.document_formatting = false
--     --  end
-- }

--  lsp.perlls.setup {
--  root_dir = function()
--  return vim.loop.cwd()
--  end
--  }

-- lsp.perlpls.setup {}

--  lsp.phpactor.setup {}

--  lsp.lemminx.setup{
--  cmd = { "/usr/bin/lemminx" }
--  }

--  lsp.pyright.setup {
--  on_attach = function(client)
--  client.server_capabilities.document_formatting = false
--  end
--  }

--  lsp.svelte.setup {}
-- lsp.vuels.setup {}

-- lsp.jdtls.setup {
--     on_attach = function(client)
--         client.server_capabilities.document_formatting = false
--     end,
--     root_dir = function()
--         return vim.loop.cwd()
--     end
-- }

--  lsp.java_language_server.setup {
--  on_attach = function(client)
--  client.server_capabilities.document_formatting = false
--  end,
--  root_dir = function()
--  return vim.loop.cwd()
--  end,
--  cmd = {'/usr/share/java/java-language-server/lang_server_linux.sh'}
--  }

-- vim.cmd [[
-- autocmd BufWritePost *.js lua vim.lsp.diagnostic.set_loclist()
-- ]]

--  --------------------------------------------------
--  -                   Lua
--  --------------------------------------------------

local sumneko_root_path = '/mnt/internal/git/upstream/lua-language-server'
local sumneko_binary =
    '/mnt/internal/git/upstream/lua-language-server/bin/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    }
}

-- }}}
-- auto formatter{{{
-- ===========================================================================
-- =                             Auto Formatter 
-- ===========================================================================

vim.cmd [[
  " autocmd FileType sh,python,php,javascript,lua autocmd BufWritePre * silent! lua vim.lsp.buf.formatting()
  " autocmd BufWritePre *.{mjs,css,html,yaml,vue,svelte,json,c,cpp} silent! lua vim.lsp.buf.formatting()

  autocmd FileType php,lua autocmd BufWritePre * silent! lua vim.lsp.buf.format { async = true }
  autocmd BufWritePre *.{css,html,yaml,yml,c,cpp,tsx,xml,java} silent! lua vim.lsp.buf.format { async = true }
]]
-- }}}
-- mappings{{{
-- ===========================================================================
-- =                             Mappings 
-- ===========================================================================

map('n', '<leader>W', '<cmd>lua vim.diagnostic.goto_next()<cr>')
map('n', '<leader>w', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

--  map('n', '<leader>l', ':silent! lnext<cr>')
--  map('n', '<leader>h', ':silent! lprev<cr>')

--  map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>')

map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
map('n', 'gj', '<cmd>cnext<cr>')
map('n', 'gk', '<cmd>cprev<cr>')
--  map('n', 'gk', '<c-o>')

map('n', 'gh', '<cmd>cclose<cr>')

map('n', '<leader>a', '<cmd>lua vim.lsp.buf.format { async = true }<cr>')

--  map('n', 'gh', '`j')

--  map('n', '<leader>gh', '<cmd>lua vim.lsp.buf.hover()<cr>')
--  map('n', '<leader>gR', '<cmd>lua vim.lsp.buf.rename()<cr>')

lsp_enabled = 0
lsp_on = 0

toggle_lsp = function()
    if lsp_enabled == 1 then
        vim.diagnostic.disable()
        lsp_enabled = 0
        lsp_on = 0
    else
        vim.diagnostic.enable()
        lsp_enabled = 1
        lsp_on = 1
    end
end

map('n', '<leader>l', '<cmd>lua toggle_lsp()<cr>')

-- }}}
--  location list{{{
vim.cmd [[
  "  autocmd BufWrite *.{py,php} exec 'lua vim.lsp.diagnostic.set_loclist()' | res 1 | wincmd k
  "  autocmd InsertEnter *.{py,php} silent! exec 'lclose'
]]
-- }}}
-- theme{{{
-- ===========================================================================
-- =                             Theme
-- ===========================================================================

local signs = {Error = ' ', Warn = '! ', Hint = ' ', Info = ' '}
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

vim.cmd [[
autocmd VimEnter * highlight DiagnosticSignError guibg=NONE guifg=red
autocmd VimEnter * highlight DiagnosticVirtualTextError guibg=NONE guifg=red

autocmd VimEnter * highlight DiagnosticSignWarn guibg=NONE guifg=yellow
autocmd VimEnter * highlight DiagnosticVirtualTextWarn guibg=NONE guifg=yellow

autocmd VimEnter * highlight DiagnosticSignHint guibg=NONE guifg=orange
autocmd VimEnter * highlight DiagnosticVirtualTextHint guifg=orange

autocmd VimEnter * highlight DiagnosticSignInfo guibg=NONE guifg=green
autocmd VimEnter * highlight DiagnosticSignInfo guibg=NONE guifg=green


]]

-- }}}
--  autocommands{{{

toggle_lsp_insert = function()
    if lsp_enabled == 0 then
        return
    end
    if lsp_on == 1 then
        vim.diagnostic.disable()
        lsp_on = 0
    else
        vim.diagnostic.enable()
        lsp_on = 1
    end
end

vim.cmd [[
    autocmd VimEnter * lua vim.diagnostic.disable()
    autocmd InsertEnter * lua toggle_lsp_insert()
    autocmd InsertLeave * lua toggle_lsp_insert()
]]
-- }}}

require('fidget').setup()

-- efm

local lua_format = {
    formatCommand = 'lua-format --double-quote-to-single-quote --no-keep-simple-function-one-line --no-keep-simple-function-one-line --no-keep-simple-control-block-one-line'
}

local shellcheck = {
    LintCommand = 'shellcheck -f gcc -x',
    lintFormats = {
        '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'
    }
}
local shfmt = {formatCommand = 'shfmt -i 4 -ci -s -sr -bn'}
local xmllint = {formatCommand = 'xmllint --format -'}
local tidy = {formatCommand = 'tidy -xml -i -q -'}
local xmlpp = {formatCommand = 'xml_pp'}
--  local autopep8 = {formatCommand = 'autopep8 --indent-size=2'}
local autopep8 = {formatCommand = 'autopep8'}
--  local black = {formatCommand = 'black'}
--  local yapf = {formatCommand = 'yapf'}
local google_java_format = {
    formatCommand = 'java -jar /usr/share/java/google-java-format/google-java-format.jar'
}
local clang_format = {
    formatCommand = 'clang-format --style="{BasedOnStyle: chromium}"'
}

-- local clang_format = {formatCommand = 'clang-format --style="{BasedOnStyle: mozilla}"'}

local prettier = {formatCommand = 'prettier'}
local php_cs_fixer = {formatCommand = 'php-cs-fixer'}
local prettier_javascript = {formatCommand = 'prettier --single-quote'}
local prettier_yaml = {formatCommand = 'prettier --tab-width 4'}
local prettier_json = {formatCommand = 'prettier --tab-width 4'}

lsp.efm.setup {
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {
        'c', 'cpp', 'javascript', 'typescriptreact', 'sh', 'markdown', 'yaml',
        'json', 'xml', 'html', 'lua'
        --  'typescript', 
        --  'python',
        --  'php',
        -- 'vue',
    },
    settings = {
        rootMarkers = {'.git/'},
        languages = {
            c = {clang_format},
            cpp = {clang_format},
            css = {prettier},
            html = {prettier},
            java = {google_java_format},
            javascript = {prettier_javascript},
            typescript = {prettier_javascript},
            typescriptreact = {prettier_javascript},
            json = {prettier_json},
            lua = {lua_format},
            markdown = {prettier},
            php = {php_cs_fixer},
            --  xml = {xmllint},
            --  xml = {tidy},
            xml = {xmlpp},
            python = {autopep8},
            --  python = {black},
            --  python = {yapf},
            yaml = {prettier_yaml},
            sh = {shellcheck, shfmt},
            svelte = {prettier_javascript},
            vue = {prettier_javascript}
        }
    }
}

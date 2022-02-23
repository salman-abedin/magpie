if not pcall(require, 'lspconfig') then return end
local map = require('map')

-- config{{{
-- ===========================================================================
-- =                             Config
-- ===========================================================================

vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      --  see: ":help vim.lsp.diagnostic.set_signs()"
      --  virtual_text = false
      -- update_in_insert = true
      -- signs = false
    })

local lsp = require 'lspconfig'

lsp.bashls.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end
}

lsp.clangd.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end
}

lsp.tsserver.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end
}

lsp.html.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end
}
lsp.cssls.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
  filetypes = {'css', 'sass'},
  settings = {sass = {validate = true}}
}

--  lsp.stylelint_lsp.setup {
  --  on_attach = function(client)
    --  client.resolved_capabilities.document_formatting = false
  --  end
--  }

lsp.pylsp.setup {
  --  on_attach = function(client)
  --  client.resolved_capabilities.document_formatting = false
  --  end
}

lsp.perlls.setup{}

--  lsp.phpactor.setup {}


--  lsp.lemminx.setup{
    --  cmd = { "/usr/bin/lemminx" }
--  }

--  lsp.pyright.setup {
--  on_attach = function(client)
--  client.resolved_capabilities.document_formatting = false
--  end
--  }

--  lsp.svelte.setup {}
--  lsp.vuels.setup {}

--  lsp.java_language_server.setup {
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
    '/mnt/internal/git/upstream/lua-language-server/bin/Linux/lua-language-server'

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

  autocmd FileType sh,python,php,javascript,lua,xml autocmd BufWritePre * silent! lua vim.lsp.buf.formatting()
  autocmd BufWritePre *.{css,html,lua,yaml,yml,md,c,cpp,tsx} silent! lua vim.lsp.buf.formatting()
]]
-- }}}
-- mappings{{{
-- ===========================================================================
-- =                             Mappings 
-- ===========================================================================

map('n', '<leader>w', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>')
map('n', '<leader>W', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>')

map('n', '<leader>l', ':silent! lnext<cr>')
map('n', '<leader>h', ':silent! lprev<cr>')

-- map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>')

map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>')
map('n', '<leader>gR', '<cmd>lua vim.lsp.buf.rename()<cr>')
map('n', '<leader>gh', '<cmd>lua vim.lsp.buf.hover()<cr>')
-- }}}
--  location list{{{
vim.cmd [[
  autocmd BufWrite *.{py,php} exec 'lua vim.lsp.diagnostic.set_loclist()' | res 1 | wincmd k
  autocmd InsertEnter *.{py,php} silent! exec 'lclose'
]]
-- }}}
-- theme{{{
-- ===========================================================================
-- =                             Theme
-- ===========================================================================

vim.fn.sign_define('DiagnosticSignError', {text = '❌'})
vim.fn.sign_define('DiagnosticSignWarning', {text = '💄'})
vim.fn.sign_define('DiagnosticSignInfo', {text = 'ℹ'})

vim.cmd [[
  autocmd BufRead * highlight DiagnosticError   guibg=none gui=bold
  autocmd BufRead * highlight DiagnosticWarning guibg=none gui=bold
  autocmd BufRead * highlight DiagnosticInfo    guibg=none gui=bold
  autocmd BufRead * highlight DiagnosticHint    guibg=none gui=bold
]]
-- }}}

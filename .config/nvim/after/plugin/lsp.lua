if not pcall(require, 'lspconfig') then return end
local map = require('map')

-- config{{{
-- ===========================================================================
-- =                             Config 
-- ===========================================================================

vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      --  see: ":help vim.lsp.diagnostic.set_signs()"
      virtual_text = false
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

-- lsp.stylelint_lsp.setup {
-- on_attach = function(client)
-- client.resolved_capabilities.document_formatting = false
-- end
-- }

lsp.html.setup {}

lsp.pyright.setup {}
-- lsp.jedi_language_server.setup{}
-- lsp.pylsp.setup{}

lsp.phpactor.setup {}

lsp.svelte.setup {}
lsp.vuels.setup {}

--  lsp.java_language_server.setup {
--  cmd = {'/usr/share/java/java-language-server/lang_server_linux.sh'}
--  }

-- lsp.cssls.setup {
--    filetypes = {'css', 'sass'},
--    settings = {css = {validate = true}, sass = {validate = true}}
-- }

-- vim.cmd [[
-- autocmd BufWritePost *.js lua vim.lsp.diagnostic.set_loclist()
-- ]]

-- }}}
-- auto formatter{{{
-- ===========================================================================
-- =                             Auto Formatter 
-- ===========================================================================

vim.cmd [[
  autocmd FileType sh,python,php autocmd BufWritePre * silent! lua vim.lsp.buf.formatting()
  autocmd BufWritePre *.{lua,js,mjs,css,html,yaml,vue,svelte,json,c,cpp} silent! lua vim.lsp.buf.formatting()
]]
-- }}}
-- mappings{{{
-- ===========================================================================
-- =                             Mappings 
-- ===========================================================================

map('n', '<leader>w', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>')
map('n', '<leader>W', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>')
-- map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>')

map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>')
map('n', '<leader>gR', '<cmd>lua vim.lsp.buf.rename()<cr>')
map('n', '<leader>gh', '<cmd>lua vim.lsp.buf.hover()<cr>')
-- }}}
-- theme{{{
-- ===========================================================================
-- =                             Theme
-- ===========================================================================

vim.fn.sign_define('LspDiagnosticsSignError', {text = '❌'})
vim.fn.sign_define('LspDiagnosticsSignWarning', {text = '⚠'})
vim.fn.sign_define('LspDiagnosticsSignInformation', {text = 'ℹ'})
vim.fn.sign_define('LspDiagnosticsSignHint', {text = '💡'})

vim.cmd [[
  " autocmd BufRead * highlight LspDiagnosticsUnderlineInformation guibg=NONE guifg=green gui=bold
  " autocmd BufRead * highlight LspDiagnosticsFloatingInformation guibg=NONE guifg=green gui=bold

  autocmd BufRead * highlight LspDiagnosticsUnderlineHint guibg=none guifg=green gui=bold
  autocmd BufRead * highlight LspDiagnosticsFloatingHint guibg=none guifg=green gui=bold

  autocmd BufRead * highlight LspDiagnosticsUnderlineWarning guibg=none guifg=yellow gui=bold
  autocmd BufRead * highlight LspDiagnosticsFloatingWarning guibg=none guifg=yellow gui=bold

  autocmd BufRead * highlight LspDiagnosticsUnderlineError guibg=none guifg=red gui=bold
  autocmd BufRead * highlight LspDiagnosticsFloatingError guibg=none guifg=red gui=bold
]]
-- }}}

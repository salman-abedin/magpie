local map = require('utils').map

vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false
      --  see: ":help vim.lsp.diagnostic.set_signs()"
      -- signs = false
    })

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

-- ===========================================================================
-- =                             Languages 
-- ===========================================================================

lsp = require 'lspconfig'

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

lsp.vuels.setup {}
lsp.html.setup {}
lsp.svelte.setup {}

lsp.pyright.setup {}
-- lsp.jedi_language_server.setup{}
-- lsp.pylsp.setup{}

-- lsp.cssls.setup {
--    filetypes = {'css', 'sass'},
--    settings = {css = {validate = true}, sass = {validate = true}}
-- }

-- ===========================================================================
-- =                             EFM LSP 
-- ===========================================================================

local lua_format = {
  formatCommand = 'lua-format --indent-width 2 --double-quote-to-single-quote'
}

local shellcheck = {
  LintCommand = 'shellcheck -f gcc -x',
  lintFormats = {
    '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'
  }
}
local shfmt = {formatCommand = 'shfmt -i 2 -ci -s -sr -bn'}
local clang_format = {
  formatCommand = 'clang-format --style="{BasedOnStyle: chromium}"'
}

-- local clang_format = {formatCommand = 'clang-format --style="{BasedOnStyle: mozilla}"'}

local prettier = {formatCommand = 'prettier --tab-width 2'}
local prettier_javascript = {
  formatCommand = 'prettier --single-quote --tab-width 2'
}

lsp.efm.setup {
  init_options = {documentFormatting = true, codeAction = false},
  filetypes = {
    'c', 'cpp', 'sh', 'lua', 'markdown', 'yaml', 'json', 'html', 'css'
    -- 'javascript',
    -- 'svelte',
    -- 'vue',
  },
  settings = {
    rootMarkers = {'.git/'},
    languages = {
      c = {clang_format},
      cpp = {clang_format},
      lua = {lua_format},
      sh = {shellcheck, shfmt},
      html = {prettier},
      css = {prettier},
      vue = {prettier_javascript},
      svelte = {prettier_javascript},
      javascript = {prettier_javascript},
      json = {prettier},
      yaml = {prettier},
      markdown = {prettier}
    }
  }
}

vim.cmd [[
  autocmd FileType sh,markdown,python autocmd BufWritePre * silent! lua vim.lsp.buf.formatting()
  autocmd BufWritePre *.{lua,js,mjs,css,html,yaml,vue,svelte,json,c,cpp} silent! lua vim.lsp.buf.formatting()
]]

-- ===========================================================================
-- =                             Mappings 
-- ===========================================================================

map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>')
map('n', '<leader>E', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>')

map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
map('n', '<leader>gh', '<cmd>lua vim.lsp.buf.hover()<cr>')
map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>')


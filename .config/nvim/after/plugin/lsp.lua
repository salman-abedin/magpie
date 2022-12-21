if pcall(require, 'mason') then
    require('mason').setup()
end

if not pcall(require, 'mason-lspconfig') then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
if pcall(require, 'cmp_nvim_lsp') then
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
end

local on_attach = function(_, buffer)
    local map = require('map')
    map('n', '<leader>a', vim.lsp.buf.format)
end

local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
}


require('lspconfig').efm.setup {
    init_options = {documentFormatting = true, codeAction = false},
    settings = {
        rootMarkers = {'.git/'},
        languages = {
            sh = {
                {
                    -- LintCommand = 'shellcheck -f gcc -x',
                    -- lintFormats = {
                    --     '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'
                    -- },
                    formatCommand = 'shfmt -i 4 -ci -s -sr -bn'
                },
            },
        }
    }
}

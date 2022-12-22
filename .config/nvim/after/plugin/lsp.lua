if pcall(require, 'mason') then
    require('mason').setup()
end

if pcall(require, 'mason-lspconfig') then
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    if pcall(require, 'cmp_nvim_lsp') then
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    end

    local on_attach = function(_, buffer)
        -- vim.diagnostic.disable()
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
end

if not pcall(require, 'lspconfig') then
    return
end

vim.diagnostic.config({
    virtual_text = false,
})

require('lspconfig').efm.setup {
    init_options = { documentFormatting = true, codeAction = false },
    settings = {
        rootMarkers = { '.git/' },
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

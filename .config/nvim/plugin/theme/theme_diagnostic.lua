local diagnostic_colors = {
    error = 'red',
    warn  = 'yellow',
    info  = 'orange',
    hint  = 'green',
}

for type, color in pairs(diagnostic_colors) do
    vim.api.nvim_set_hl(0, 'diagnosticvirtualtext' .. type, { bg = 'none', fg = color, bold = true })
    vim.api.nvim_set_hl(0, 'diagnosticunderline' .. type, { fg = color, bold = true })
    vim.api.nvim_set_hl(0, 'diagnosticfloating' .. type, { fg = color, bold = true })
    vim.api.nvim_set_hl(0, 'diagnosticlualine' .. type, { bg = '#444444', fg = color, bold = true })
    -- vim.api.nvim_set_hl(0, 'diagnosticsign' .. type, { fg = color, bold = true })
end

--  ===========================================================================
--  =                             Exp
--  ===========================================================================

-- local signs = {Error = ' ', Warn = '! ', Hint = ' ', Info = ' '}
-- for type, icon in pairs(signs) do
--     local hl = 'DiagnosticSign' .. type
--     vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
-- end

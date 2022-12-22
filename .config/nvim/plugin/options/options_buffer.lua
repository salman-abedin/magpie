local buffer_options = {

    -- spellfile = '/home/salman/.config/nvim/spell/en.utf-8.add', -- spell file path
    expandtab = true, -- Use spaces instead of tabs
    undofile = true, -- enable undoing between buffer closes

    softtabstop = 4, -- spaces per tab (in insert mode)
    shiftwidth = 4, -- spaces per tab (when shifting)
    tabstop = 4, -- number of spaces per tab

    -- backspace = 'indent,eol,start', -- Enable proper backspace behavior
    -- smarttab = true, -- <tab>/<BS> indent/dedent in leading whitespace
    -- autoindent = true, -- match indents new lines with previous line.
}

for key, value in pairs(buffer_options) do
    vim.api.nvim_buf_set_option(0, key, value)
end

local overrides = function()

    vim.bo.softtabstop = 4 -- spaces per tab (in insert mode)
    vim.bo.shiftwidth = 4 -- spaces per tab (when shifting)
    vim.bo.tabstop = 4 -- number of spaces per tab

    vim.opt.formatoptions =
    vim.opt.formatoptions + 'c' -- comments respect textwidth
        + 'j' -- Auto-remove comments if possible.
        + 'n' -- Indent past the formatlistpat, not underneath it.
        + 'q' -- Allow formatting comments w/ gq
        - '2' -- I'm not in gradeschool anymore
        - 'a' -- Auto formatting is BAD.
        - 'o' -- O and o, don't continue comments
        - 'r' -- No commenting on enter pressing
        - 't' -- Don't auto format my code. I got linters for that.

end

-- vim.cmd [[ autocmd BufNewFile,BufRead * lua overrides() ]]

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    callback = function()
        overrides()
    end,
})

--  python_overrides = function()
--  vim.bo.softtabstop = 4 -- spaces per tab (in insert mode)
--  vim.bo.shiftwidth = 4 -- spaces per tab (when shifting)
--  vim.bo.tabstop = 4 -- number of spaces per tab
--  end
--  vim.cmd [[ autocmd FileType python autocmd BufNewFile,BufRead * lua python_overrides() ]]

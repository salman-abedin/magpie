local window_options = {
    foldmethod = 'marker', -- User markers for folding
    signcolumn = 'no', -- Never show the sign column (i.e. no more jerking)
    number = true, -- Set absolute line numbers
    relativenumber = true, -- Set relative line numbers

    cursorline = true, -- Show cursor line

    wrap = false, -- Disable line wrapping

    foldlevel = 99, -- Disable folding at startup

    --  list = true, -- show whitespace

    linebreak = true, -- break lines consistantly
    breakindent = true -- break indents consistantly

}

for key, value in pairs(window_options) do
    vim.api.nvim_win_set_option(0, key, value)
end

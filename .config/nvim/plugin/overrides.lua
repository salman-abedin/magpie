overrides = function()

  vim.bo.softtabstop = 2 -- spaces per tab (in insert mode)
  vim.bo.shiftwidth = 2 -- spaces per tab (when shifting)
  vim.bo.tabstop = 2 -- number of spaces per tab

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

vim.cmd [[ autocmd BufNewFile,BufRead * lua overrides() ]]

local map = require('map')

local qalam_on = 0

qalam = function()
  if qalam_on == 0 then
    --  vim.api.nvim_win_set_option(0, 'spell', true)
    vim.api.nvim_win_set_option(0, 'rightleft', true)
    vim.api.nvim_set_option('delcombine', true)

    vim.o.number = false
    vim.o.relativenumber = false

    map('i', 'a', 'أ')
    map('i', 'A', 'ع')
    -- map('i', 'A', 'ََ')

    map('i', ',a', 'ا')
    map('i', '\'a', 'ء')

    map('i', ',A', 'ئ')

    map('i', 'aa', 'آ')

    map('i', 'b', 'ب')
    map('i', 't', 'ت')
    map('i', 'th', 'ث')
    map('i', 'j', 'ج')
    map('i', 'H', 'ح')
    map('i', 'kh', 'خ')
    map('i', 'd', 'د')
    map('i', 'dh', 'ذ')
    map('i', 'r', 'ر')
    map('i', 'zh', 'ز')
    map('i', 's', 'س')
    map('i', 'sh', 'ش')
    map('i', 'S', 'ص')
    map('i', 'D', 'ض')
    map('i', 'T', 'ط')
    map('i', 'z', 'ظ')
    map('i', 'e', 'ع')
    map('i', 'g', 'غ')
    map('i', 'f', 'ف')
    map('i', 'k', 'ك')
    map('i', 'K', 'ق')
    map('i', 'l', 'ل')
    map('i', 'm', 'م')
    map('i', 'n', 'ن')
    map('i', 'h', 'ه')
    map('i', 'w', 'و')
    map('i', 'y', 'ي')
    map('i', 'Y', 'ى')
    map('i', 'i', 'إ')
    map('i', 'I', 'ِ')
    map('i', 'u', 'أ')
    map('i', 'U', 'ُ')
    map('i', ',t', 'ة')
    map('i', '?', '؟')

    map('i', '1', '١')
    map('i', '2', '٢')
    map('i', '3', '٣')
    map('i', '4', '٤')
    map('i', '5', '٥')
    map('i', '6', '٦')
    map('i', '7', '٧')
    map('i', '8', '٨')
    map('i', '9', '٩')
    map('i', '0', '٠')

    map('i', '(', '﴾')
    map('i', ')', '﴿')

    map('i', ',', '،')
    map('i', ',;', '؛')
    map('i', '.', '۔')

    qalam_on = 1
    print('Turned qalam on')
  else
    --  vim.api.nvim_win_set_option(0, 'spell', false)

    vim.api.nvim_win_set_option(0, 'rightleft', false)
    vim.api.nvim_set_option('delcombine', false)
    vim.o.number = true
    vim.o.relativenumber = true

    qalam_on = 0
    print('Turned qalam off')
  end
end

vim.cmd [[ autocmd BufReadPost *.ar.* lua qalam() ]]
require('map')('n', 'ga', '<cmd>lua qalam()<cr>', {silent = true})

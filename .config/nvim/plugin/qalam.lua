qalam_on = 0

qalam = function()
  if qalam_on == 0 then
    vim.api.nvim_win_set_option(0, 'spell', true)
    vim.api.nvim_win_set_option(0, 'rightleft', true)
    vim.api.nvim_set_option('delcombine', true)

    m('i', 'a', 'أ')
    -- m('i', 'A', 'ََ')

    m('i', ',a', 'ا')
    m('i', '\'a', 'ء')

    m('i', ',A', 'ئ')

    m('i', 'aa', 'آ')

    m('i', 'b', 'ب')
    m('i', 't', 'ت')
    m('i', 'th', 'ث')
    m('i', 'j', 'ج')
    m('i', 'H', 'ح')
    m('i', 'kh', 'خ')
    m('i', 'd', 'د')
    m('i', 'dh', 'ذ')
    m('i', 'r', 'ر')
    m('i', 'zh', 'ز')
    m('i', 's', 'س')
    m('i', 'sh', 'ش')
    m('i', 'S', 'ص')
    m('i', 'D', 'ض')
    m('i', 'T', 'ط')
    m('i', 'z', 'ظ')
    m('i', 'e', 'ع')
    m('i', 'g', 'غ')
    m('i', 'f', 'ف')
    m('i', 'k', 'ك')
    m('i', 'K', 'ق')
    m('i', 'l', 'ل')
    m('i', 'm', 'م')
    m('i', 'n', 'ن')
    m('i', 'h', 'ه')
    m('i', 'w', 'و')
    m('i', 'y', 'ي')
    m('i', 'Y', 'ى')
    m('i', 'i', 'إ')
    m('i', 'I', 'ِ')
    m('i', 'u', 'أ')
    m('i', 'U', 'ُ')
    m('i', ',t', 'ة')
    m('i', '?', '؟')

    m('i', '1', '١')
    m('i', '2', '٢')
    m('i', '3', '٣')
    m('i', '4', '٤')
    m('i', '5', '٥')
    m('i', '6', '٦')
    m('i', '7', '٧')
    m('i', '8', '٨')
    m('i', '9', '٩')
    m('i', '0', '٠')

    m('i', '(', '﴾')
    m('i', ')', '﴿')

    m('i', ',', '،')
    m('i', ',;', '؛')
    m('i', '.', '۔')

    qalam_on = 1
    print('Turned qalam on')
  else
    vim.api.nvim_win_set_option(0, 'spell', false)

    vim.api.nvim_win_set_option(0, 'rightleft', false)
    vim.api.nvim_set_option('delcombine', false)

    qalam_on = 0
    print('Turned qalam off')
  end
end

vim.cmd [[ autocmd BufReadPost *.ar.* lua qalam() ]]
require('map')('n', 'ga', '<cmd>lua qalam()<cr>', {silent = true})

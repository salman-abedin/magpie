if not pcall(require, 'telescope') then return end

require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            'node_modules/.*',
            '%.env',
            '%.lock',
            '%.astro',
            '%.ex4',
            '%.set',
        },
        mappings = { i = { ['kj'] = 'close', ['<ESC>'] = 'close' } }
    },

    pickers = {
        find_files = {
            layout_config = { prompt_position = 'top' },
            sorting_strategy = 'ascending',
            previewer = false,
            mappings = {
                i = {
                    [';'] = 'select_default',
                    [':'] = 'select_tab',
                    -- [':'] = 'select_horizontal',
                }
                -- i = {[';'] = 'select_default', ['kj'] = 'close', ['<ESC>'] = 'close'}
            }
            -- theme = 'dropdown'
            -- theme = 'ivy'
            -- hidden = true
        },

        live_grep = { theme = 'ivy', mappings = { i = { [';'] = 'send_to_qflist' } } }

    }
}
require('telescope').load_extension('fzy_native')

vim.cmd [[
	" Maintain one single tab at all times
	" autocmd TabEnter * silent! execute 'tabonly | wa | %bd' | call setqflist([])

	" Maintain one single buffer at all times
	" autocmd BufCreate * silent! execute 'wa | %bd | e# | bd#'
]]

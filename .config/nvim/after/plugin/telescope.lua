if not pcall(require, 'telescope') then return end

require('telescope').setup {
    defaults = {
        layout_config = { prompt_position = 'top' },
        sorting_strategy = 'ascending',
        file_ignore_patterns = {
            'node_modules/.*',
            '%.env',
            '%.lock',
            '%.astro',
            '%.ex4',
            '%.set',
        },
        mappings = {
            i = {
                ['kj'] = 'close',
                ['<ESC>'] = 'close',
                [';'] = 'select_default',
            }
        }
    },

    pickers = {
        find_files = {
            previewer = false,
            mappings = {
                i = {
                    [':'] = 'select_tab',
                    -- [':'] = 'select_horizontal',
                }
            }
        },
        live_grep = { theme = 'ivy' },
        lsp_definitions = { theme = 'ivy' },
        lsp_references = { theme = 'ivy' },
        diagnostics = { theme = 'ivy' },
    }
}
require('telescope').load_extension('fzy_native')

vim.cmd [[
	" Maintain one single tab at all times
	" autocmd TabEnter * silent! execute 'tabonly | wa | %bd' | call setqflist([])

	" Maintain one single buffer at all times
	" autocmd BufCreate * silent! execute 'wa | %bd | e# | bd#'
]]

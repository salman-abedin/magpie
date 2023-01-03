if not pcall(require, 'lualine') then
    return
end

local function total_lines()
    return ' ' .. vim.api.nvim_buf_line_count(0)
end

local function machine()
    local cmd_user = io.popen('echo $USER')
    local user = string.gsub(cmd_user:read('*a'), '\n', '')
    cmd_user:close()

    local cmd_host = io.popen('cat /proc/sys/kernel/hostname')
    local host = string.gsub(cmd_host:read('*a'), '\n', '')
    cmd_host:close()

    return ' ' .. user .. '  ' .. host
end

require('lualine').setup {
    -- options = { theme = lualine_theme },
    options = { theme = 'onedark' },
    sections = {
        lualine_a = { { machine } },
        lualine_b = { { 'branch' }, { 'location', icon = { '' } } },
        lualine_c = { { 'filename', icon = { '' } } },
        lualine_x = {
            {
                'diagnostics',
                diagnostics_color = {
                    error = 'DiagnosticLualineError',
                    warn = 'DiagnosticLualineWarn',
                    info = 'DiagnosticLualineInfo',
                    hint = 'DiagnosticLualineHint'
                },
                symbols = {
                    error = ' ',
                    warn = '! ',
                    info = ' ',
                    hint = ' '
                }
            }
        },
        lualine_y = { { total_lines } },
        lualine_z = {
            {
                'filetype',
                fmt = function(str)
                    return ' ' .. str
                end
            }
        }
    }
}

--  ╔══════════════════════════════════════════════════════════════════════
--  ║                              Exp
--  ╚══════════════════════════════════════════════════════════════════════

--  local function file_name()
--  return ' ' .. string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd() .. '/', '')
--  end

--  colors{{{

-- -- local lualine_theme = require 'lualine.themes.gruvbox-material'
-- local lualine_theme = require 'lualine.themes.OceanicNext'

-- --  local background_color = nil
-- local background_color = '#282828'
-- --  local background_color = '#665c54'

-- local foreground_color = '#dfbf8e'
-- local foreground_color_file = '#ea6962'
-- --  local foreground_color = '#111111'

-- lualine_theme.normal.a.bg = '#222222'
-- lualine_theme.normal.b.bg = '#333333'
-- lualine_theme.normal.c.bg = '#444444'

-- lualine_theme.insert.a.bg = '#222222'
-- lualine_theme.insert.b.bg = '#333333'
-- lualine_theme.insert.c.bg = '#444444'

-- lualine_theme.visual.a.bg = '#222222'
-- lualine_theme.visual.b.bg = '#333333'
-- lualine_theme.visual.c.bg = '#444444'

-- lualine_theme.command.a.bg = '#222222'
-- lualine_theme.command.b.bg = '#333333'
-- lualine_theme.command.c.bg = '#444444'

-- lualine_theme.normal.a.fg = foreground_color
-- lualine_theme.normal.b.fg = foreground_color
-- --  lualine_theme.normal.c.fg = foreground_color
-- lualine_theme.normal.c.fg = foreground_color_file

-- lualine_theme.insert.a.fg = foreground_color
-- lualine_theme.insert.b.fg = foreground_color
-- --  lualine_theme.insert.c.fg = foreground_color
-- lualine_theme.insert.c.fg = foreground_color_file

-- lualine_theme.visual.a.fg = foreground_color
-- lualine_theme.visual.b.fg = foreground_color
-- --  lualine_theme.visual.c.fg = foreground_color
-- lualine_theme.visual.c.fg = foreground_color_file

-- lualine_theme.command.a.fg = foreground_color
-- lualine_theme.command.b.fg = foreground_color
-- --  lualine_theme.command.c.fg = foreground_color
-- lualine_theme.command.c.fg = foreground_color_file

-- vim.cmd [[
-- autocmd VimEnter * highlight DiagnosticLualineError guibg=#444444 guifg=red
-- autocmd VimEnter * highlight DiagnosticLualineWarn guibg=#444444 guifg=yellow
-- autocmd VimEnter * highlight DiagnosticLualineInfo guibg=#444444 guifg=orange
-- autocmd VimEnter * highlight DiagnosticLualineHint guibg=#444444 guifg=green
-- ]]

-- }}}

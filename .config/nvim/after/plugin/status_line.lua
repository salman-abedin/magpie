if not pcall(require, 'lualine') then
    return
end

--  colors{{{
local gruvbox_material_custom = require 'lualine.themes.gruvbox-material'

--  local background_color = nil
local background_color = '#282828'
--  local background_color = '#665c54'

local foreground_color = '#dfbf8e'
local foreground_color_file = '#ea6962'
--  local foreground_color = '#111111'

gruvbox_material_custom.normal.a.bg = '#222222'
gruvbox_material_custom.normal.b.bg = '#333333'
gruvbox_material_custom.normal.c.bg = '#444444'

gruvbox_material_custom.insert.a.bg = '#222222'
gruvbox_material_custom.insert.b.bg = '#333333'
gruvbox_material_custom.insert.c.bg = '#444444'

gruvbox_material_custom.visual.a.bg = '#222222'
gruvbox_material_custom.visual.b.bg = '#333333'
gruvbox_material_custom.visual.c.bg = '#444444'

gruvbox_material_custom.command.a.bg = '#222222'
gruvbox_material_custom.command.b.bg = '#333333'
gruvbox_material_custom.command.c.bg = '#444444'

gruvbox_material_custom.normal.a.fg = foreground_color
gruvbox_material_custom.normal.b.fg = foreground_color
--  gruvbox_material_custom.normal.c.fg = foreground_color
gruvbox_material_custom.normal.c.fg = foreground_color_file

gruvbox_material_custom.insert.a.fg = foreground_color
gruvbox_material_custom.insert.b.fg = foreground_color
--  gruvbox_material_custom.insert.c.fg = foreground_color
gruvbox_material_custom.insert.c.fg = foreground_color_file

gruvbox_material_custom.visual.a.fg = foreground_color
gruvbox_material_custom.visual.b.fg = foreground_color
--  gruvbox_material_custom.visual.c.fg = foreground_color
gruvbox_material_custom.visual.c.fg = foreground_color_file

gruvbox_material_custom.command.a.fg = foreground_color
gruvbox_material_custom.command.b.fg = foreground_color
--  gruvbox_material_custom.command.c.fg = foreground_color
gruvbox_material_custom.command.c.fg = foreground_color_file

vim.cmd [[
autocmd VimEnter * highlight DiagnosticLualineError guibg=#444444 guifg=red
autocmd VimEnter * highlight DiagnosticLualineWarn guibg=#444444 guifg=yellow
autocmd VimEnter * highlight DiagnosticLualineHint guibg=#444444 guifg=orange
autocmd VimEnter * highlight DiagnosticLualineInfo guibg=#444444 guifg=green
]]

-- }}}
--  functions{{{
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
-- }}}

require('lualine').setup {
    options = {theme = gruvbox_material_custom},
    sections = {
        lualine_a = {{machine}},
        lualine_b = {{'branch'}, {'location', icon = {''}}},
        lualine_c = {{'filename', icon = {''}}},
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
        lualine_y = {{total_lines}},
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

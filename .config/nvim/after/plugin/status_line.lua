if not pcall(require, 'el') then return end

local generator = function()
  local extensions = require('el.extensions')
  local subscribe = require('el.subscribe')
  local segments = {}

  table.insert(segments, '%#rainbowcol4#') -- set color

  table.insert(segments, '📁 %f') -- filename

  table.insert(segments, '%=') -- go to right

  table.insert(segments,
               subscribe.buf_autocmd('el_git_branch', 'BufEnter',
                                     function(window, buffer)
    local branch = extensions.git_branch(window, buffer)
    if branch then return '🌴 ' .. branch end
  end))

  table.insert(segments,
               subscribe.buf_autocmd('el_git_status', 'BufWritePost',
                                     function(window, buffer)
    local changes = extensions.git_changes(window, buffer)
    if changes then return ' 🔧 ' .. changes end
  end))

  -- table.insert(segments, '📖 %L') -- total lines count

  -- table.insert(segments,
  -- subscribe.buf_autocmd('el_file_icon', 'BufRead',
  -- function(_, buffer)
  -- return extensions.file_icon(_, buffer)
  -- end))

  -- table.insert(segments, ' | ') -- seperator
  -- table.insert(segments, '🍨 %{&filetype}') -- filetype

  -- table.insert(segments, ' | ') -- seperator
  -- table.insert(segments, '🎁 %{&fileencoding?&fileencoding:&encoding}') -- encoding

  return segments
end

require('el').setup {generator = generator}

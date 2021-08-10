if not pcall(require, 'lspconfig') then return end

local lsp = require 'lspconfig'

local lua_format = {
  formatCommand = 'lua-format --indent-width 2 --double-quote-to-single-quote'
}

local shellcheck = {
  LintCommand = 'shellcheck -f gcc -x',
  lintFormats = {
    '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'
  }
}
local shfmt = {formatCommand = 'shfmt -i 2 -ci -s -sr -bn'}
local google_java_format = {
  formatCommand = 'java -jar /usr/share/java/google-java-format/google-java-format.jar'
}
local clang_format = {
  formatCommand = 'clang-format --style="{BasedOnStyle: chromium}"'
}

-- local clang_format = {formatCommand = 'clang-format --style="{BasedOnStyle: mozilla}"'}

local prettier = {formatCommand = 'prettier --tab-width 2'}
local php_cs_fixer = {formatCommand = 'php-cs-fixer'}
local prettier_javascript = {
  formatCommand = 'prettier --single-quote --tab-width 2'
}

lsp.efm.setup {
  init_options = {documentFormatting = true, codeAction = false},
  filetypes = {
    'c', 'cpp', 'javascript', 'sh', 'lua', 'markdown', 'yaml', 'json', 'html', 'css'
    --  'php'
    -- 'svelte',
    -- 'vue',
  },
  settings = {
    rootMarkers = {'.git/'},
    languages = {
      c = {clang_format},
      cpp = {clang_format},
      css = {prettier},
      html = {prettier},
      java = {google_java_format},
      javascript = {prettier_javascript},
      json = {prettier},
      lua = {lua_format},
      markdown = {prettier},
      php = {php_cs_fixer},
      sh = {shellcheck, shfmt},
      svelte = {prettier_javascript},
      vue = {prettier_javascript},
      yaml = {prettier}
    }
  }
}

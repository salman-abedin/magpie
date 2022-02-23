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
local shfmt = {formatCommand = 'shfmt -ci -s -sr -bn'}
local xmllint = {formatCommand = 'xmllint --format -'}
--  local autopep8 = {formatCommand = 'autopep8 --indent-size=2'}
local autopep8 = {formatCommand = 'autopep8'}
--  local black = {formatCommand = 'black'}
--  local yapf = {formatCommand = 'yapf'}
local google_java_format = {
  formatCommand = 'java -jar /usr/share/java/google-java-format/google-java-format.jar'
}
local clang_format = {
  formatCommand = 'clang-format --style="{BasedOnStyle: chromium}"'
}

-- local clang_format = {formatCommand = 'clang-format --style="{BasedOnStyle: mozilla}"'}

local prettier = {formatCommand = 'prettier'}
local php_cs_fixer = {formatCommand = 'php-cs-fixer'}
local prettier_javascript = {formatCommand = 'prettier --single-quote'}

lsp.efm.setup {
  init_options = {documentFormatting = true, codeAction = false},
  filetypes = {
    'c', 'cpp', 'javascript', 'typescriptreact', 'sh', 'markdown', 'yaml', 'json', 'html'
    --  'typescript', 
    --  'xml'
    --  'lua',
    --  'python',
    --  'php',
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
      typescript = {prettier_javascript},
      typescriptreact = {prettier_javascript},
      json = {prettier},
      lua = {lua_format},
      markdown = {prettier},
      php = {php_cs_fixer},
      xml = {xmllint},
      python = {autopep8},
      --  python = {black},
      --  python = {yapf},
      --  yaml = {prettier}
      sh = {shellcheck, shfmt},
      svelte = {prettier_javascript},
      vue = {prettier_javascript},
    }
  }
}

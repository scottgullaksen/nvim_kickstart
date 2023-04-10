-- Find info on how null-ls works and configs at https://github.com/jose-elias-alvarez/null-ls.nvim
-- Builtins can be found at https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins
-- Note that these sources will respect any project-local config file e.g. .prettierrc, eslint.json etc

local null_ls = require 'null-ls'

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions

require('mason-null-ls').setup {
  ensure_installed = {
    'stylua', 'prettier', 'black', 'eslint', 'luacheck', 'pylint',
  },
  automatic_setup = true,
}

null_ls.setup {
  debug = false,
  sources = {
    code_actions.gitsigns,
  },
}

require('mocos.core.options') -- should be loaded first (mapleader)
require('mocos.core.keymaps')
require('mocos.core.autocmds')
require('mocos.lazy')

vim.lsp.config('elixirls', {
  cmd = { "/home/mocos/.local/elixir-ls/release/language_server.sh" },
})

-- cargo install htmx-lsp
vim.lsp.enable({ 'htmx-lsp', 'elixirls' })

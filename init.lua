require('mocos.core.options') -- should be loaded first (mapleader)
require('mocos.core.keymaps')
require('mocos.core.autocmds')
require('mocos.lazy')

-- cargo install htmx-lsp
vim.lsp.enable({ 'htmx-lsp' })

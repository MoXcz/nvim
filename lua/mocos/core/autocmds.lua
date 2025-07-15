-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0

    vim.bo.filetype = 'terminal'
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function()
    local key = vim.keymap.set
    key('n', 'grs', ':LspStop<CR>')
  end,
})

-- go install golang.org/x/tools/cmd/goimports@latest
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.cmd('silent! write')
    vim.fn.system({ 'goimports', '-w', vim.api.nvim_buf_get_name(0) })
    vim.cmd('edit!')
  end,
})

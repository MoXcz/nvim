return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function()
          local key = vim.keymap.set
          key('n', '<leader>rd', ':LspStop<CR>')
          -- Rename the variable under your cursor.
          key('n', 'grn', vim.lsp.buf.rename)
          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          key({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action)
          key('n', '<leader>dl', vim.diagnostic.open_float)
          key('n', '[d', vim.diagnostic.goto_prev)
          key('n', ']d', vim.diagnostic.goto_next)
          key('n', 'K', vim.lsp.buf.hover)
        end,
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      mason_lspconfig.setup_handlers({
        function(server)
          lspconfig[server].setup({
            capabilities = capabilities,
          })
        end,
        ['emmet_ls'] = function()
          lspconfig['emmet_ls'].setup({
            capabilities = capabilities,
            filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte', 'php' },
          })
        end,
        ['rust_analyzer'] = function() end,
      })
    end,
  },
}

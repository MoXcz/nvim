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
          key('n', 'grs', ':LspStop<CR>')
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
        ['html'] = function()
          lspconfig['html'].setup({
            capabilities = capabilities,
            filetypes = { 'html', 'templ', 'template' },
          })
        end,
        ['htmx'] = function()
          lspconfig['htmx'].setup({
            capabilities = capabilities,
            filetypes = { 'html', 'templ', 'template' },
          })
        end,
        ['tailwindcss'] = function()
          lspconfig['tailwindcss'].setup({
            capabilities = capabilities,
            filetypes = { "templ", "astro", "javascript", "typescript", "react" },
            settings = {
              tailwindCSS = {
                includeLanguages = {
                  templ = "html",
                },
              },
            }
          })
        end
      })
    end,
  },
}

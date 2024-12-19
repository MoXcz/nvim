return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'saghen/blink.cmp',
      {
        'folke/lazydev.nvim',
        ft = 'lua', -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          },
        },
      },
    },
    config = function()
      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')
      -- local cmp_nvim_lsp = require("cmp_nvim_lsp")
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function()
          -- TODO: Add keymaps
          local key = vim.keymap.set
          key('n', '<leader>rd', ':LspStop<CR>')
        end,
      })

      -- local capabilities = cmp_nvim_lsp.default_capabilities()
      mason_lspconfig.setup_handlers({
        function(server)
          lspconfig[server].setup({
            --capabilities = capabilities
          })
        end,
        ['emmet_ls'] = function()
          lspconfig['emmet_ls'].setup({
            -- capabilities = capabilities
            filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
          })
          -- ["lua_ls"] = function()
          --       -- Configure lua server (with special settings)
          --       lspconfig["lua_ls"].setup({
          --         -- capabilities = capabilities,
          --         settings = {
          --           Lua = {
          --             -- make the language server recognize "vim" global
          --             diagnostics = {
          --               globals = { "vim" },
          --             },
          --             completion = {
          --               callSnippet = "Replace",
          --             },
          --           },
          --         },
          --       })
          --     end,
        end,
      })
    end,
  },
}

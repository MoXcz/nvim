return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre' },
  cmd = { 'ConformInfo' },
  config = function()
    local conform = require('conform')
    conform.setup({
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'gofmt' },
        python = { 'isort', 'black' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        svelte = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        graphql = { 'prettier' },
        liquid = { 'prettier' },
        cpp = { 'clangd' },
        java = { 'google-java-format' },
        c = { 'clang-format' },

        -- "_" run formatters on filetypes that don't have other formatters configured.
        ['_'] = { 'trim_whitespace' },
      },
      format_on_save = function(bufnr)
        if vim.g.autoformat then
          local disable_filetypes = {}
          local lsp_format_opt
          if disable_filetypes[vim.bo[bufnr].filetype] then
            lsp_format_opt = "never"
          else
            lsp_format_opt = "fallback"
          end
          return {
            timeout_ms = 500,
            lsp_format = lsp_format_opt,
          }
        else
          return
        end
      end,
      tify_on_error = true,
      notify_no_formatters = true,
    })
    vim.keymap.set({ 'n', 'v' }, '<leader>af', function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = 'Format file or range' })
  end,
}

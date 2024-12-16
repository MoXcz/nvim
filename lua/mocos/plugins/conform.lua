return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre' },
  cmd = { 'ConformInfo' },
  config = function()
    local conform = require('conform')
    conform.setup({
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'goimports', 'gofmt' },
        python = function(bufnr)
          if require('conform').get_formatter_info('ruff_format', bufnr).available then
            return { 'ruff_format' }
          else
            return { 'isort', 'black' }
          end
        end,
        -- "_" run formatters on filetypes that don't have other formatters configured.
        ['_'] = { 'trim_whitespace' },
      },
      -- If this is set, Conform will run the formatter on save.
      format_on_save = {
        lsp_format = 'fallback',
        timeout_ms = 1000,
        async = false,
      },
      notify_on_error = true,
      notify_no_formatters = true,
    })
    vim.keymap.set({ 'n', 'v' }, '<leader>af', function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = 'Format file or range' })
  end,
}

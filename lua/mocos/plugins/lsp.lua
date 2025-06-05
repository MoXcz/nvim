return {
  'neovim/nvim-lspconfig',
  -- Example on how to configure LSPs in >+0.11
  vim.lsp.config('emmet_ls', {
    filetypes = { 'html', 'css', 'javascript', 'typescript', 'vue' },
    init_options = {
      html = {
        options = {
          showSuggestionsAsSnippets = true,
        },
      },
    },
  }),
}

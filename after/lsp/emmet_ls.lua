return {
  -- Example on how to configure LSPs in >+0.11
  filetypes = { 'html' },
  init_options = {
    html = {
      options = {
        showSuggestionsAsSnippets = true,
      },
    },
  },
}

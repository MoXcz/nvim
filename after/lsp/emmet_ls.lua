return {
   -- Example on how to configure LSPs in >+0.11
   filetypes = { 'html', 'css', 'javascript', 'typescript', 'vue' },
    init_options = {
      html = {
        options = {
          showSuggestionsAsSnippets = true,
        },
      },
    },
}

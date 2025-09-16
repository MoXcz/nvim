return {
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
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets', 'folke/lazydev.nvim' },
    version = 'v1.*',
    opts = {
      signature = { enabled = true },
      cmdline = {
        enabled = true,
        completion = { menu = { auto_show = true } },
      },
      keymap = {
        preset = 'default',
        ['<C-e>'] = { 'show_and_insert', 'fallback' }
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = 'mono',
      },
      completion = {
        trigger = { show_on_trigger_character = true },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          window = {
            border = nil,
            scrollbar = false,
            winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
          },
        },
        menu = {
          border = nil,
          scrolloff = 1,
          scrollbar = false,
          auto_show = false,
          draw = {
            columns = {
              { 'kind_icon' },
              { 'label',      'label_description', gap = 1 },
              { 'kind' },
              { 'source_name' },
            },
          },
        },
      },
      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          -- dont show LuaLS require statements when lazydev has items
          lsp = { fallbacks = { 'lazydev' } },
          lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
  },
}

return {
  settings = {
    cargo = {
      allFeatures = true,
      features = { 'ssr' },
    },
    procMacro = {
      ignored = {
        leptos_macro = {
          -- "component", -- Uncomment if needed
          'server',
        },
      },
    },
    rustfmt = {
      overrideCommand = { 'rustfmt', '--edition', '2024' },
      config = '~/.config/rustfmt/rustfmt.toml',
    },
  },
}

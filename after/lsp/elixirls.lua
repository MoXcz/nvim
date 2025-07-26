--- git clone https://github.com/elixir-lsp/elixir-ls
--- cd elixir-ls
--- mix deps.get
--- mix compile
--- mix compile && mix elixir_ls.release2 -o release

--- 'root_dir' is chosen like this: if two or more directories containing `mix.exs` were found when searching directories upward, the second one (higher up) is chosen, with the assumption that it is the root of an umbrella app. Otherwise the directory containing the single mix.exs that was found is chosen.
return {
  filetypes = { 'elixir', 'eelixir', 'heex', 'surface' },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local matches = vim.fs.find({ 'mix.exs' }, { upward = true, limit = 2, path = fname })
    local child_or_root_path, maybe_umbrella_path = unpack(matches)
    local root_dir = vim.fs.dirname(maybe_umbrella_path or child_or_root_path)

    on_dir(root_dir)
  end,
}

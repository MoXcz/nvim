return {
  "olexsmir/gopher.nvim",
  ft = "go",
  build = function()
    vim.cmd.GoInstallDeps()
  end,
  opts = {},
  config = function()
    local key = vim.keymap.set
    key("n", "gsj", "<cmd>GoTagAdd json<CR>")
  end
}

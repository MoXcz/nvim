local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out,                            'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = {
    change_detection = { notify = false, enabled = false },
    { import = 'mocos.plugins' },
    -- Icons
    ui = { icons = vim.g.have_nerd_font and {} or {} },
    -- Colorscheme
    {
      'rebelot/kanagawa.nvim',
      opts = { compile = true },
      config = function()
        vim.cmd.colorscheme('kanagawa-dragon')
      end,
    },
    { "rose-pine/neovim" },
    { "sainnhe/gruvbox-material" },
    -- Highlight to do's
    {
      'folke/todo-comments.nvim',
      event = 'VimEnter',
      dependencies = { 'nvim-lua/plenary.nvim' },
      opts = { signs = false },
    },
    {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require("colorizer").setup()
      end
    },
  },
})

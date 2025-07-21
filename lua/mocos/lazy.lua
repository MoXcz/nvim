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

-- This will load the "lazy" directory found at `lazypath` (where LazyVim was cloned)
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
    { 'rose-pine/neovim' },
    { 'sainnhe/gruvbox-material' },
    { 'catppuccin/nvim', name = 'catppuccin' },
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
        require('colorizer').setup()
      end,
    },
    {
      'folke/zen-mode.nvim',
      opts = {},
    },
    {
      'folke/twilight.nvim',
      opts = {},
    },
    {
      'jbyuki/venn.nvim',
      config = function()
        -- venn.nvim: enable or disable keymappings
        function _G.Toggle_venn()
          local venn_enabled = vim.inspect(vim.b.venn_enabled)
          if venn_enabled == 'nil' then
            vim.b.venn_enabled = true
            vim.cmd([[setlocal ve=all]])
            -- draw a line on HJKL keystokes
            vim.api.nvim_buf_set_keymap(0, 'n', 'J', '<C-v>j:VBox<CR>', { noremap = true })
            vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<C-v>k:VBox<CR>', { noremap = true })
            vim.api.nvim_buf_set_keymap(0, 'n', 'L', '<C-v>l:VBox<CR>', { noremap = true })
            vim.api.nvim_buf_set_keymap(0, 'n', 'H', '<C-v>h:VBox<CR>', { noremap = true })
            -- draw a box by pressing "f" with visual selection
            vim.api.nvim_buf_set_keymap(0, 'v', 'f', ':VBox<CR>', { noremap = true })
          else
            vim.cmd([[setlocal ve=]])
            vim.api.nvim_buf_del_keymap(0, 'n', 'J')
            vim.api.nvim_buf_del_keymap(0, 'n', 'K')
            vim.api.nvim_buf_del_keymap(0, 'n', 'L')
            vim.api.nvim_buf_del_keymap(0, 'n', 'H')
            vim.api.nvim_buf_del_keymap(0, 'v', 'f')
            vim.b.venn_enabled = nil
          end
        end
        -- toggle keymappings for venn using <leader>v
        vim.api.nvim_set_keymap('n', '<leader>v', ':lua Toggle_venn()<CR>', { noremap = true })
      end,
    },
  },
})

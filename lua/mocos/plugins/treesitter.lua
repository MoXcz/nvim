return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline', 'regex', 'templ', 'bash', 'rust', 'python' },
        sync_install = false,
        auto_install = true, -- install missing parsers when entering buffer
        ignore_install = {},
        modules = {},
        highlight = {
          enable = true,
          -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            -- This works with nodes and scopes (:InspectTree)
            init_selection = '<C-n>',    -- maps in normal mode to init the node/scope selection
            node_incremental = '<C-n>',  -- increment to the upper named parent
            scope_incremental = '<C-s>', -- increment to the upper scope (as defined in locals.scm)
            node_decremental = '<C-p>',  -- decrement to the previous node
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['ii'] = '@conditional.inner',
              ['ai'] = '@conditional.outer',
              ['il'] = '@loop.inner',
              ['al'] = '@loop.outer',
              ['at'] = '@comment.outer',
            },
            selection_modes = {
              ['@parameter.outer'] = 'v',   -- charwise
              ['@function.outer'] = 'V',    -- charwise
              ['@class.outer'] = '<c-v>',   -- charwise
              ['@conditional.inner'] = 'V', -- linewise
              ['@loop.inner'] = 'V',        -- linewise
              ['@comment.outer'] = 'V',     -- linewise
            }
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']f'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']F'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[f'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[F'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>ac'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>Ac'] = '@parameter.inner',
          },
        },
      })
    end,
  },
}

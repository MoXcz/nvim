return {
  {
    'MeanderingProgrammer/markdown.nvim',
    main = 'render-markdown',
    opts = {},
    name = 'render-markdown',                                                            -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you use the mini.nvim suite
  },

  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    dependencies = { 'nvim-lua/plenary.nvim', },
    config = function()
      require('obsidian').setup({
        workspaces = {
          {
            name = 'Notes',
            path = '~/Notes',
          },
        },
        ui = { enable = false },
        notes_subdir = '01 - Notes',
        disable_frontmatter = true,
        new_notes_location = 'notes_subdir',
        templates = {
          folder = '99 - Meta/Templates',
          date_format = '%Y-%m-%d',
          time_format = '%H:%M',
          -- A map for custom variables, the key should be the variable and the value a function
          substitutions = {},
          mappings = { ["<leader>ch"] = "" }
        },
        note_id_func = function(title)
          if title ~= nil then
            return title               -- Use the tag name as the filename
          else
            return tostring(os.time()) -- Fallback: use timestamp if no title is found
          end
        end,
        vim.keymap.set("n", "<leader>R", ":ObsidianRename ", { noremap = true, silent = false })
      })
    end,
  },
}

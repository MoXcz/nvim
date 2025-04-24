return {
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
}

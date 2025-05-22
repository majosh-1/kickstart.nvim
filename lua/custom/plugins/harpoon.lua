-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      harpoon:setup {}
      vim.keymap.set('n', '<leader>l', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Open harpoon window' })

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Adds Current buffer to Harpoon List' })
      vim.keymap.set('n', '<leader>q', function()
        harpoon:list():select(1)
      end, { desc = 'Go to 1st listing' })
      vim.keymap.set('n', '<leader>w', function()
        harpoon:list():select(2)
      end, { desc = 'Go to 2nd listing' })
      vim.keymap.set('n', '<leader>e', function()
        harpoon:list():select(3)
      end, { desc = 'Go to 3nd listing' })
      vim.keymap.set('n', '<leader>r', function()
        harpoon:list():select(4)
      end, { desc = 'Go to 4nd listing' })
    end,
  },
}

local harpoon = require 'harpoon'
harpoon:setup {}

-- basic telescope configuration
-- local conf = require('telescope.config').values
-- local function toggle_telescope(harpoon_files)
--   local file_paths = {}
--   for _, item in ipairs(harpoon_files.items) do
--     table.insert(file_paths, item.value)
--   end
--
--   require('telescope.pickers')
--     .new({}, {
--       prompt_title = 'Harpoon',
--       finder = require('telescope.finders').new_table {
--         results = file_paths,
--       },
--       previewer = conf.file_previewer {},
--       sorter = conf.generic_sorter {},
--     })
--     :find()
-- end

vim.keymap.set('n', '<C-l>', function()
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

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<C-M-p>', function()
  harpoon:list():prev()
end)
vim.keymap.set('n', '<C-M-n>', function()
  harpoon:list():next()
end)

vim.keymap.set('n', '<leader>dq', function()
  harpoon:list():remove_at(1)
end, { desc = 'Delete 1st listing' })
vim.keymap.set('n', '<leader>dw', function()
  harpoon:list():remove_at(2)
end, { desc = 'Delete 2nd listing' })
vim.keymap.set('n', '<leader>de', function()
  harpoon:list():remove_at(3)
end, { desc = 'Delete 3nd listing' })
vim.keymap.set('n', '<leader>dr', function()
  harpoon:list():remove_at(4)
end, { desc = 'Delete 4nd listing' })

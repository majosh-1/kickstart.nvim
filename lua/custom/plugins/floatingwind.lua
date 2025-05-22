return {
  {
    'nvim-lua/plenary.nvim', -- Dummy plugin to satisfy Lazy.nvim
    lazy = false,
    config = function()
      require 'custom.floatingwindow'
    end,
  },
}

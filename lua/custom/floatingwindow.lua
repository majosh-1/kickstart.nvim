vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Esc Esc terminal mode' })

local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local function OpenFloatingWindow(opts)
  opts = opts or {}

  -- Get current screen dimensions
  local columns = vim.o.columns
  local lines = vim.o.lines

  -- Calculate default width and height as 80% of screen size
  local width = opts.width or math.floor(columns * 0.8)
  local height = opts.height or math.floor(lines * 0.8)

  -- Calculate top-left corner position to center the window
  local row = math.floor((lines - height) / 2)
  local col = math.floor((columns - width) / 2)

  -- Create a new buffer (not listed in buffer list)
  local buf = nil

  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  -- Define window options
  local win_opts = {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded', -- you can also use 'single', 'double', 'shadow', etc.
  }

  -- Open the floating window
  local win = vim.api.nvim_open_win(buf, true, win_opts)

  return { buf = buf, win = win }
end

local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = OpenFloatingWindow { buf = state.floating.buf }
    if vim.bo[state.floating.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
  vim.cmd 'normal i'
end

vim.api.nvim_create_user_command('Floaterm', toggle_terminal, { desc = 'Open Floating Terminal Custom Command' })
vim.keymap.set({ 'n', 't' }, '<leader>fw', toggle_terminal, { desc = 'Open Floating Terminal' })

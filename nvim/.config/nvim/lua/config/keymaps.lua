vim.keymap.set("n", "<space><space>l", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>l", ":.lua<CR>")
vim.keymap.set("v", "<space>l", ":lua<CR>")

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Hightlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local terminal_split = nil

-- new_toggle_term
-- Spawn a new bottom split terminal, and focus it
-- Stores the buffer and window in terminal_split for toggling
-- TODO: fix split_dir and size config and store in terminal_split
-- so that the recall will use the config
local function new_toggle_term(config)
  config = config or {}
  local split_dir = config.split_dir or 'below'
  local size = config.size or 15
  -- print("split_dir = " .. split_dir .. " size = " .. size)

  vim.api.nvim_open_win(0, true, { split = split_dir })
  vim.cmd.term()
  if split_dir == 'below' then
    vim.api.nvim_win_set_height(0, size)
  else
    vim.api.nvim_win_set_width(0, size)
  end
  vim.cmd('startinsert')
  terminal_split = { buf = vim.api.nvim_get_current_buf(), win = vim.api.nvim_get_current_win() }
end

-- toggle_term
-- Toggles the terminal window stored in terminal_split
-- Spawns a new one if terminal_split is nil
function ToggleTerm()
  if terminal_split then
    if vim.api.nvim_win_is_valid(terminal_split.win) then
      vim.api.nvim_set_current_win(terminal_split.win)
      vim.cmd('hide')
    else
      if vim.api.nvim_buf_is_valid(terminal_split.buf) then
        vim.api.nvim_open_win(terminal_split.buf, true, { split = 'below' })
        vim.api.nvim_win_set_height(0, 15)
        terminal_split.win = vim.api.nvim_get_current_win()
        vim.cmd('startinsert')
      end
    end
  else
    -- No terminal_split in memory, create a fresh one
    new_toggle_term()
  end
end

vim.api.nvim_create_autocmd("TermClose", {
  group = vim.api.nvim_create_augroup('custom-term-close', { clear = true }),
  callback = function()
    if terminal_split then
      if vim.api.nvim_win_is_valid(terminal_split.win) then
        vim.api.nvim_win_close(terminal_split.win, true)
      end
      terminal_split = nil
    end
  end
})

vim.keymap.set('n', '<esc>t', ':lua ToggleTerm()<CR>',
  { noremap = true, silent = true, desc = "Toggle terminal" })
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>')
vim.keymap.set('t', '<esc>t', function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
  ToggleTerm()
end, { noremap = true, silent = true })

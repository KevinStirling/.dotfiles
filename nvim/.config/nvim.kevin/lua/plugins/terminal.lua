-- new_toggle_term(config)
-- Spawn a new bottom split terminal, and focus it
-- Stores the buffer and window in terminal_split for toggling
--
-- TODO: fix split_dir and size config and store in terminal_split
-- so recall will use the config
local terminal_split = nil
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

-- ToggleTerm()
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
        new_toggle_term()
    end
end

-- INFO: manage state of terminal split on close
vim.api.nvim_create_autocmd("TermClose", {
    group = vim.api.nvim_create_augroup('custom-term-close', { clear = true }),
    callback = function()
        if vim.g.terminal_split then
            if vim.api.nvim_win_is_valid(vim.g.terminal_split.win) then
                vim.api.nvim_win_close(vim.g.terminal_split.win, true)
            end
            vim.g.terminal_split = nil
        end
    end
})

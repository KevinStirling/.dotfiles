-- local cmd = vim.lsp.rpc.connect('127.0.0.1', 6005)
-- local pipe = '/tmp/godot.pipe' -- I use /tmp/godot.pipe
--
-- vim.lsp.start({
--   name = 'gdscript',
--   cmd = cmd,
--   root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
--   on_attach = function(client, bufnr)
--     vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
--   end
-- })
local port = tonumber(vim.env.GDScript_Port) or 6005
local pipe = "/tmp/godot.pipe"

-- Start the Neovim RPC server exactly once.
-- If already started, skip. If stale path exists, try to remove it.
local function ensure_server(pipe_path)
  if vim.v.servername ~= "" then
    return
  end

  -- If something already exists at that path, it may be stale.
  local st = vim.uv.fs_stat(pipe_path)
  if st then
    pcall(vim.uv.fs_unlink, pipe_path)
  end

  local ok, err = pcall(vim.fn.serverstart, pipe_path)
  if not ok then
    vim.notify(("Godot pipe serverstart failed: %s"):format(err), vim.log.levels.WARN)
  end
end

ensure_server(pipe)

local cmd = vim.lsp.rpc.connect("127.0.0.1", port)

vim.lsp.start({
  name = "Godot",
  cmd = cmd,
  root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, { upward = true })[1]),
})

---@mod user.lsp
---
---@brief [[
---LSP related functions
---@brief ]]

local M = {}

---Gets a 'ClientCapabilities' object, describing the LSP client capabilities
---Extends the object with capabilities provided by plugins.
---@return lsp.ClientCapabilities
function M.make_client_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- Add com_nvim_lsp capabilities
  local cmp_lsp = require('cmp_nvim_lsp')
  local cmp_lsp_capabilities = cmp_lsp.default_capabilities()
  capabilities = vim.tbl_deep_extend('keep', capabilities, cmp_lsp_capabilities)
  -- Add any additional plugin capabilities here.
  -- Make sure to follow the instructions provided in the plugin's docs.
  return capabilities
end

function M.start(name, cmd, root_files, extra)
  if vim.fn.executable(cmd[1]) ~= 1 then return end
  vim.lsp.start(vim.tbl_extend('keep', extra or {}, {
    name = name,
    cmd = cmd,
    root_dir = vim.fs.dirname(
      vim.fs.find(root_files, { upward = true })[1]
    ) or vim.fn.expand('%:p:h'),
    capabilities = M.make_client_capabilities(),
  }))
end

return M



-- Exit if the language server isn't available
if vim.fn.executable('rust-analyzer') ~= 1 then
  return
end

local root_files = {
  'main.rs',
  'cargo.toml',
  '.git',
  '.rs'
}

vim.lsp.start {
  name = 'rust_ls',
  cmd = { 'rust-analyzer' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
}

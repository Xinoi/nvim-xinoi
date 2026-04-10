if vim.g.did_load_plugins_plugin then
  return
end
vim.g.did_load_plugins_plugin = true

-- many plugins annoyingly require a call to a 'setup' function to be loaded,
-- even with default configs

require('nvim-surround').setup()
require('nvim-autopairs').setup({
  check_ts = true, -- treesitter-aware, schließt smarter
})
require('alpha').setup(require('alpha.themes.dashboard').config)
require("oil").setup({
  prompt_save_on_select_new_entry = true,
})
require('fidget').setup({})

require('which-key').setup {
  preset = 'helix'
}

require('which-key').add({
  { "<leader>f", group = "telescope" },
  { "<leader>g", group = "git" },
  { "<leader>gf", group = "git diffview" },
  { "<leader>gh", group = "git hunk" },
  { "<leader>gl", group = "git line" },
  { "<leader>t", group = "terminal" },
  { "<leader>w", group = "window" },
  { "<leader>wh", group = "window height" },
  { "<leader>o", group = "obsidian" },
})

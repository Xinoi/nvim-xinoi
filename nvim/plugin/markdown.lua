require('render-markdown').setup({
    enabled = true,
    file_types = { 'markdown' },
})

require("obsidian").setup({
    workspaces = {
      {
        name = "personal",
        path = "~/Seafile/Main/Notes",
      },
    },
})

require("image").setup({
  backend = "kitty",
  processor = "magick_cli",
  integrations = {
    markdown = {
      enabled = true,
      download_remote_images = true,
    },
  },
})

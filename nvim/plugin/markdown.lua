require('render-markdown').setup({
    enabled = true,
    file_types = { 'markdown' },
})

require("obsidian").setup({
  ui = { enable = false },
  legacy_commands = false,
  workspaces = {
    {
      name = "personal",
      path = "~/Seafile/Main/Notes",
    },
  },
  -- note_id_func: Titel als Dateiname statt zufälliger Zettel-ID
  note_id_func = function(title)
    if title then
      return title:gsub(" ", "-"):lower()
    else
      return require("obsidian.builtin").zettel_id()
    end
  end,

  -- Frontmatter: eigene eindeutige ID + Titel als Alias
  frontmatter = {
    enabled = true,
    func = function(note)
      local id = note.metadata and note.metadata.id or os.date("%Y%m%d%H%M%S")
      return {
        id = id,
        aliases = note.aliases,
        tags = note.tags,
      }
    end,
    sort = { "id", "aliases", "tags" },
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

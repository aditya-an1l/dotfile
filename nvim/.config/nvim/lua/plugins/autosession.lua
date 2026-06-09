return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { "<leader>wr", "<cmd>AutoSession search<CR>", desc = "Session search" },
    { "<leader>ws", "<cmd>AutoSession save<CR>", desc = "Save session" },
    { "<leader>wa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
  },
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    -- Uncomment to enable debug logs
    -- log_level = 'debug',
    session_lens = {
      picker = nil, -- "telescope"|"snacks"|"fzf"|"select"|nil (auto detection)
      mappings = {
        delete_session = { "i", "<C-d>" },
        alternate_session = { "i", "<C-s>" },
        copy_session = { "i", "<C-y>" },
      },
      picker_opts = {
        -- Configure picker options based on picker used:
        -- For Telescope: border, layout_config, etc.
        -- For Snacks: preset, preview, layout, etc.
        -- For Fzf-Lua: height, width, etc.
        height = 0.8,
        width = 0.5,
      },
      -- If load_on_setup is false, the picker must be opened manually with :AutoSession search
      load_on_setup = true,
    },
  },
}

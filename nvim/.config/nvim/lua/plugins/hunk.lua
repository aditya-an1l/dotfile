return {
  "julienvincent/hunk.nvim",
  cmd = { "DiffEditor" },
  dependencies = {
    "MunifTanjir/nui.nvim",
    -- optional:
    -- "nvim-tree/nvim-web-devicons",
    -- "echasnovski/mini.icons",
  },
  config = function()
    local hunk = require("hunk")
    hunk.setup({
      keys = {
        global = {
          quit = { "q" },
          accept = { "<leader><Cr>" },
          focus_tree = { "<leader>e" },
        },

        tree = {
          expand_node = { "l", "<Right>" },
          collapse_node = { "h", "<Left>" },
          open_file = { "<Cr>" },
          toggle_file = { "a" },
        },

        diff = {
          toggle_hunk = { "A" },
          toggle_line = { "a" },
          toggle_line_pair = { "s" },
          prev_hunk = { "[h" },
          next_hunk = { "]h" },
          toggle_focus = { "<Tab>" },
        },
      },

      ui = {
        tree = {
          mode = "nested",
          width = 35,
          use_float = false,
          float = {
            height = 1.0,
            border = nil,
            position = "left",
            padding = { left = 1, right = 1 },
            close = { "<Esc>" },
          },
        },
        layout = "vertical",
        confirm_before_quit = false,
      },

      icons = {
        enable_file_icons = true,
        selected = "󰡖",
        deselected = "",
        partially_selected = "󰛲",
        folder_open = "",
        folder_closed = "",
        expanded = "",
        collapsed = "",
      },

      hooks = {
        on_tree_mount = function(_context) end,
        on_diff_mount = function(_context) end,
      },
    })
  end,
}

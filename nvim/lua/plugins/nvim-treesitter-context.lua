local M = {
  "nvim-treesitter/nvim-treesitter-context",
  event = "VeryLazy",
  commit = "fb445fa2aee9f0dce7257bb6f628795e6e13d6e6",
  dependencies = {"nvim-treesitter/nvim-treesitter"},
}

function M.config()
  local ts_context = require "treesitter-context"
  ts_context.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
  }
end

return M 

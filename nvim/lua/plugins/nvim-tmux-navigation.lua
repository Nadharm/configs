return {
  -- Setup tmux/vim navigation
  "alexghergh/nvim-tmux-navigation",
  config = function()
    local nvim_tmux_nav = require("nvim-tmux-navigation")
    nvim_tmux_nav.setup {
      disable_when_zoomed = true
    }
    vim.keymap.set('n', "<C-b><Left>", nvim_tmux_nav.NvimTmuxNavigateLeft)
    vim.keymap.set('n', "<C-b><Down>", nvim_tmux_nav.NvimTmuxNavigateDown)
    vim.keymap.set('n', "<C-b><Up>", nvim_tmux_nav.NvimTmuxNavigateUp)
    vim.keymap.set('n', "<C-b><Right>", nvim_tmux_nav.NvimTmuxNavigateRight)
  end,
}

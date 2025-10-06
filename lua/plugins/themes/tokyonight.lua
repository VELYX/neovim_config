return {
  'folke/tokyonight.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {},
  config = function()
    require('tokyonight').setup {
      -- use the night style
      style = 'moon',
      transparent = true,
    }
    vim.cmd [[colorscheme tokyonight]]
  end,
}

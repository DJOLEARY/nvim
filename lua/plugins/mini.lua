return { 
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      local statusline = require('mini.statusline')
      statusline.setup {}

      local indentscope = require('mini.indentscope')
      indentscope.setup {
        draw = {
          delay = 0,
          animation = indentscope.gen_animation.none(),
        }
      }

      local notify = require('mini.notify')
      notify.setup {}

      local diff = require('mini.diff')
      diff.setup {}

      local icons = require('mini.icons')
      icons.setup {}
    end,
  }
}

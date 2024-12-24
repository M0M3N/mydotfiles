return {
  "echasnovski/mini.nvim",
  config = function()
    local statusline = require 'mini.statusline'
    local pairs = require 'mini.pairs'
    local hi = require 'mini.hipatterns'

    statusline.setup { use_icons = true }
    pairs.setup {}

    local words = { important = '#9f90f3' }
    local word_color_group = function(_, match)
      local hex = words[match]
      if hex == nil then return nil end
      return MiniHipatterns.compute_hex_color_group(hex, 'bg')
    end

    hi.setup({
      highlighters = {
        fixme      = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack       = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo       = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note       = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
        word_color = { pattern = '%S+', group = word_color_group },
        hex_color  = hi.gen_highlighter.hex_color(),
      }
    })
  end
}
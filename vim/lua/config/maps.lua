require("config.helpers")
require('config.maps.codecompanion')
require('config.maps.navigation')
require('config.maps.fugitive')

-- Clear search highlighting
Map('n', '<C-Space>', ':nohlsearch<Bar>:echo<CR>')

-- Folding with spacebar
Map('n', '<space>', 'za')

-- Tab navigation
Map('n', '<TAB>', ':tabp<CR>')
Map('n', '<S-TAB>', ':tabn<CR>')
--
-- Moving code blocks
Map('v', '<', '<gv')
Map('v', '>', '>gv')
--
-- Line navigation with wrap
Map('n', 'j', 'gj')
Map('n', 'k', 'gk')

require("lua.configs.default")
require('lua.config.maps')

require("lua.plugins.lazy")
--require('plugins.lspconfig')
require('lualine').setup()
require('telescope').setup()
require("CopilotChat").setup()

require'nvim-web-devicons'.get_icons()
require'lspconfig'.pyright.setup()
require("bufferline").setup()
require('lualine').setup{ 
  options = { theme  = 'moonfly', },
}

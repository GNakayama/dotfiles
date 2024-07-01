require("plugins.lazy")
require("configs.default")
require('configs.maps')

--require('plugins.lspconfig')
require('lualine').setup()
require('telescope').setup()
require("CopilotChat").setup()

require'nvim-web-devicons'.get_icons()
--require'lspconfig'.pyright.setup()
require("bufferline").setup()
require('lualine').setup{
  options = { theme  = 'moonfly', },
}

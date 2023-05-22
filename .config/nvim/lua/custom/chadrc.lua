local M = {}

M.options = {
   shiftwidth = 3,
}

M.ui = {
   theme = "tokyonight",
   transparency = true,
   nvdash = {
      load_on_startup = true,
      header = {
         "███╗   ██╗██╗   ██╗██╗███╗   ███╗",
         "████╗  ██║██║   ██║██║████╗ ████║",
         "██╔██╗ ██║██║   ██║██║██╔████╔██║",
         "██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
         "██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
         "╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
      },
   },
}

M.plugins = "custom.plugins"

return M

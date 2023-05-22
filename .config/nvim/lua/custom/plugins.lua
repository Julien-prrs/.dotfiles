local plugins = {
   {
      "NvChad/nvim-colorizer.lua",
      opts = {
         filetypes = {
            "*"
         },
         user_default_options = {
            RRGGBBAA = true,
            css = true,
            mode = "background",
         },
      },
   },
   {
      "nvim-treesitter/nvim-treesitter",
      opts = {
         ensure_installed = {
            "html",
            "css",
            "scss",
            "javascript",
            "typescript",
            "jsdoc",
            "vue",
            "python",
            "php",
            "dockerfile",
         },
      },
   },
}

return plugins

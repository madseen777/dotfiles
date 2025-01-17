local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "kyazdani42/nvim-web-devicons", "SmiteshP/nvim-navic" },
}

function M.config()
  local navic = require("nvim-navic")
  require("lualine").setup({
    extensions = {
      "quickfix",
      "symbols-outline",
      "toggleterm",
    },
    options = {
      component_separators = { " ", " " },
      section_separators = { " ", " " },
    },
    sections = {
      lualine_a = { {
        "filename",
        path = 1,
        symbols = { modified = "", readonly = "", unnamed = "" },
      } },
      lualine_b = {
        "branch",
        {
          "diagnostics",
          sources = { "nvim_lsp" },
          symbols = { error = " ", warn = " ", info = " ", hint = "" },
        },
      },
      lualine_c = { { navic.get_location, cond = navic.is_available } },
    },
    inactive_sections = {
      lualine_a = { {
        "filename",
        path = 1,
        symbols = { modified = "", readonly = "", unnamed = "" },
      } },
      lualine_c = {},
    }
  })
end

return M

local M = {
  "kylechui/nvim-surround"
}

function M.config()
  require("nvim-surround").setup({
    keymaps = {
      visual = "s"
    },
  })
end

return M

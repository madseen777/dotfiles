local M = {
  { "rest-nvim/rest.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    ft = { "http" },
    config = true,
  },
  {
    "theprimeagen/harpoon",
    config = function()
      require("harpoon").setup({
        global_settings = {
          save_on_toggle = true,
          enter_on_sendcmd = true,
        },
      })
    end,
  },
  {
    url = "https://gitlab.com/yorickpeterse/nvim-pqf",
    event = "BufReadPre",
    config = function()
      require("pqf").setup()
    end,
  },
  "stevearc/dressing.nvim",
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      local notify = require("notify")
      notify.setup(
        {
          render = "minimal",
          stages = "fade",
          timeout = 3000,
        }
      )
      vim.notify = notify
    end
  },
  {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete", "Bwipeout" },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        enable_check_bracket_line = false,
        check_ts = true,
      })
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = true
  },
  {
    "nmac427/guess-indent.nvim",
    config = true
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "stylua.toml" },
      })
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
    config = function()
      require("symbols-outline").setup({
        auto_preview = false,
      })
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("trouble").setup()
    end,
  },
  -- Git
  {
    "TimUntersberger/neogit",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = "Neogit",
    config = function()
      require("neogit").setup({
        disable_hint = true,
        disable_insert_on_commit = false,
        integrations = {
          diffview = true,
        },
      })
    end,
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require("git-worktree").setup({})
    end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles" },
  },
  {
    "akinsho/git-conflict.nvim",
    config = true
  },
  {
    "CRAG666/code_runner.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("code_runner").setup({
        term = {
          size = 15,
          mode = "startinsert",
        },
        filetype = {
          go = "cd $dir && go run $fileName",
          python = "python3 $fileName",
          sh = "bash $fileName",
        },
      })
    end,
  },
  {
    "abecodes/tabout.nvim",
    event = "InsertEnter",
    dependencies = { "nvim-cmp", "nvim-treesitter" },
    config = function()
      require("tabout").setup({
        tabkey = "<Tab>",
        act_as_tab = true,
        act_as_shift_tab = true,
        enable_backwards = true,
        completion = true,
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
          { open = "<", close = ">" },
        },
        ignore_beginning = true,
      })
    end,
  },
  {
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<leader>cR",
        function()
          require("ssr").open()
        end,
        mode = { "n", "x" },
        desc = "Structural Replace",
      },
    },
  },
  {
    "mrjones2014/dash.nvim",
    build = "make install",
    cmd = { "Dash", "DashWord" },
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  {
    "jakewvincent/mkdnflow.nvim",
    ft = { "md", "markdown" },
    rocks = "luautf8",
    config = function()
      require("mkdnflow").setup({
        create_dirs = false,
        mappings = {
          MkdnToggleToDo = { { "n", "v" }, "<leader>mt" },
        },
      })
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "ToggleTermOpenAll", "ToggleTermCloseAll" },
    config = function()
      require("toggleterm").setup({
        size = 30,
      })
    end,
  },
  {
    -- instead of nvim-telescope/telescope-symbols.nvim
    "ziontee113/icon-picker.nvim",
    cmd = { "PickEverything" },
    config = function()
      require("icon-picker")
    end,
  },
  {
    "axieax/urlview.nvim",
    keys = {
      {
        "<leader>fu",
        "<cmd>UrlView buffer action=clipboard<cr>",
        desc = "URLs",
      }
    },
    config = true
  },
  {
    "rafcamlet/nvim-luapad",
    ft = "lua",
  },
  "junegunn/vim-easy-align",
  "direnv/direnv.vim",
  "gpanders/editorconfig.nvim",
  "sheerun/vim-polyglot",
  { "itspriddle/vim-marked", ft = { "md", "markdown" } },
  {
    "tjdevries/cyclist.vim",
    config = function()
      vim.cmd([[
          silent call cyclist#set_eol("default", "")
          silent call cyclist#set_tab("default", "│ ")
          silent call cyclist#set_trail("default", "·")
          silent call cyclist#add_listchar_option_set("clean", { 'eol': '', 'tab': '  ' }, v:true)
          silent call cyclist#add_listchar_option_set("debug", { 'space': '·' }, v:true)
        ]])
    end,
  },
}

return M

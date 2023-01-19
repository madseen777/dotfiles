local vo = vim.opt_local
vo.iskeyword:append("$")
vo.tabstop = 2
vo.shiftwidth = 2
vo.softtabstop = 2
vo.expandtab = true
vo.formatoptions = vim.opt_local.formatoptions - { "c", "r", "o" }

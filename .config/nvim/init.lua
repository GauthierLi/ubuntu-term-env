if vim.g.vscode then
  cmdheight = 1 -- this is the new line I added
  return
end
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("plugin_configs.gitsigns")
require("plugin_configs.doge")
require("plugin_configs.neovide")
require("plugin_configs.copilot")

-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = "space:·"

-- dictionary 
vim.opt.dictionary:append("dictionary/general.txt")
vim.opt.dictionary:append("dictionary/words.txt")

-- 启用 true color 支持
vim.opt.termguicolors = true
-- 设置配色方案为 monokai_pro
-- vim.cmd([[colorscheme monokai_pro]])
vim.cmd([[colorscheme monokai_pro_pink]])
-- 设置 lightline 的配色方案为 monokai_pro
-- vim.g.lightline = { colorscheme = 'monokai_pro' }
vim.g.lightline = { colorscheme = 'monokai_pro_pink' }

vim.g.lazyvim_check_order = false
vim.g.neoformat_c_clangformat = {
    exe = 'clang-format',
    args = {'-assume-filename=%:p', '--style=./.clang-format'},
    stdin = 1,
}

vim.g.neoformat_enabled_c = {'clangformat'}
vim.opt.scrolloff = 10

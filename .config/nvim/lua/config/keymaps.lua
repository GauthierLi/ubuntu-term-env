-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

-- 取消 s 默认功能
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)

-- visual模式下缩进代码
map("v", "<Tab>", ">gv", opt)
map("v", "<S-Tab>", "<gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)


-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)

-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

map("n", "0", "^", opt)
map("n", "9", "$", opt)
map("n", "wq", ":wq", opt)
map("n", "qq", ":q", opt)
map("n", "<leader>u", ":set number! relativenumber!<CR>", opt)
map("v", "<C-f>", '"zy<Esc>/<C-r>z<CR>', opt)

map("n", "<leader>ds", [[:%s/\s\+$//e<CR>]],  {noremap = true, silent = true, desc="delete space"})
map("n", "<leader>gd", ":Gdiffsplit", {noremap = true, silent = true, desc="Gdiffsplit"}) 

map("i", "<C-b><C-b>", "import pdb; pdb.set_trace()", opt)
map("i", "<C-d><C-d>", "import debugpy\nprint(\"waiting for client ...\")\ndebugpy.listen(5678)\ndebugpy.wait_for_client()", opt)
map("v",  '<C-a>', 'ggVG', opt)
-- 上下滚动浏览
map("n", "<C-A-j>", "4j", opt)
map("n", "<C-A-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "10k", opt)
map("n", "<C-d>", "10j", opt)


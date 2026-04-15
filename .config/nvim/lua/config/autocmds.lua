-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

if vim.g.neovide then
  -- vim.opt.guifont = "CodeNewRoman Nerd Font:h14"  -- 使用 Nerd 字体
  -- vim.opt.guifont = "CodeNewRoman Nerd Font Mono:b"         -- 加粗
  -- vim.opt.guifont = "CodeNewRoman Nerd Font Mono:h14:h14:i"         -- 斜体
  -- vim.opt.guifont = "CodeNewRoman Nerd Font Mono:h14:b,i"       -- 加粗和斜体
  -- vim.opt.guifont = "CodeNewRoman Nerd Font Mono:h14:antialias" -- 开启抗锯齿

  -- 插入模式粘贴
  vim.keymap.set("i", "<C-S-v>", '<C-r>+', { noremap = true, silent = true })
  -- Terminal 模式粘贴
  vim.keymap.set("t", "<C-S-v>", "<C-\\><C-n>\"+pa", { noremap = true, silent = true })
end

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- LazyVim auto format
vim.g.autoformat = false
vim.opt.relativenumber = false
vim.keymap.set("n", "<leader>cp", function()
   local filepath = vim.fn.expand("%:p")
   vim.fn.setreg("+", filepath) -- 将路径复制到系统剪贴板
   print("Copied: " .. filepath) -- 提示路径已复制
end, { noremap = true, silent = true, desc = "Copy absolute file path" })

-- 定义删除标记的快捷键
vim.keymap.set('n', '<leader>dm', function()
  local mark = vim.fn.input("Delete mark: ")
  if mark == "!" then 
    vim.cmd('delmarks!')
    print("Delete all marks!")
  elseif mark ~= "" then
    vim.cmd('delmarks ' .. mark)
    print("Deleted mark: " .. mark)
  else
    print("No mark specified!")
  end
end, { noremap = true, silent = true, desc = "Delete mark" })

-- Declare
vim.api.nvim_set_keymap('n', '<leader>dP', ':lua InsertCustomComment("python")<CR>', { noremap = true, silent = true , desc = "Declareation python"})
vim.api.nvim_set_keymap('n', '<leader>dC', ':lua InsertCustomComment("cpp")<CR>', { noremap = true, silent = true , desc = "Declareation cpp"})

function InsertCustomComment(language)
    local current_time = os.date("%Y/%m/%d %H:%M:%S")
    local filename = vim.fn.expand('%:t') -- 获取当前文件名
    local author = "GauthierLi"
    local contact = "lwklxh@163.com"
    local year = 2024

    local comment_start, comment_end = "", ""
    if language == "python" then
        comment_start, comment_end = "'''", "'''"
    elseif language == "cpp" then
        comment_start, comment_end = "/*", "*/"
    end

    -- 构造注释模板
    local comment_template = string.format([[%s
@File    :   %s
@Time    :   %s
@Author  :   %s
@Version :   1.0
@Contact :   %s
@License :   Copyright (C) %s %s, All rights reserved.
%s

%s
Description here ...
%s]], comment_start, filename, current_time, author, contact, year, author, comment_end, comment_start, comment_end)
    -- 在当前光标位置插入模板
    vim.api.nvim_put(vim.split(comment_template, "\n"), 'l', true, true)
end

-- 定义一个函数来包裹选中文本
vim.api.nvim_set_keymap("x", "\\", ":lua WrapSelectionWithChar()<CR>", { noremap = true, silent = true })
function WrapSelectionWithChar()
    -- 获取用户输入的字符
    local char = vim.fn.input("Enter the character to wrap: ")
    if char == "" then return end -- 如果没有输入字符，直接退出

    -- 获取当前的选中范围
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")

    -- 进入插入模式，并包裹选中的内容
    vim.api.nvim_buf_set_text(0, start_pos[2] - 1, start_pos[3] - 1, start_pos[2] - 1, start_pos[3] - 1, {char})
    vim.api.nvim_buf_set_text(0, end_pos[2] - 1, end_pos[3], end_pos[2] - 1, end_pos[3], {char})
  -- 映射到 visual 模式下的 "\"
end



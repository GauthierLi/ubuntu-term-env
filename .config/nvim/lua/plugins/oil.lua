return {
  {
    "FerretDetective/oil-git-signs.nvim",
    ft = "oil",
    opts = {},
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- 自定义 winbar 显示当前目录
      function _G.get_oil_winbar()
        local dir = require("oil").get_current_dir()
        if dir then
          return vim.fn.fnamemodify(dir, ":~")
        else
          return vim.api.nvim_buf_get_name(0)
        end
      end

      local detail = false
      require("oil").setup({
        -- 核心配置
        default_file_explorer = true,  -- 替代默认文件浏览器
        skip_confirm_for_simple_edits = true,
        delete_to_trash = true,  -- 删除到回收站
        use_trash = true,

        -- 按键映射
        keymaps = {
          ["<CR>"] = "actions.select",  -- 打开文件/文件夹
          ["<BS>"] = "actions.parent",  -- 返回上级
          ["-"] = "actions.close",  -- 关闭 Oil
          ["<C-r>"] = "actions.refresh",  -- 刷新
          ["<leader>y"] = "actions.yank_entry",  -- 复制路径
          ["zh"] = "actions.toggle_hidden",  -- 切换隐藏文件
          ["<leader>."] = "actions.toggle_hidden",  -- 切换隐藏文件
          ["\\"] = { "actions.select", opts = { horizontal = true } },  -- 水平分割打开
          ["|"] = { "actions.select", opts = { vertical = true } },  -- 垂直分割打开
          ["gd"] = {  -- 切换详细视图
            desc = "Toggle file detail view",
            callback = function()
              detail = not detail
              if detail then
                require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
              else
                require("oil").set_columns({ "icon" })
              end
            end,
          },
          -- 禁用默认键
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["<C-k>"] = false,
          ["<C-j>"] = false,
          ["g."] = false,
        },

        -- winbar 配置
        win_options = {
          winbar = "%!v:lua.get_oil_winbar()",
          signcolumn = "yes:2",  -- 显示 Git 状态符号列
          statuscolumn = "",
        },

        -- 视图选项
        view_options = {
          show_hidden = true,  -- 默认显示隐藏文件
          natural_order = "fast",
          case_insensitive = false,
        },
      })

      -- 全局快捷键：用 - 打开上级目录
      vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Open Oil" })
    end,
  },
}

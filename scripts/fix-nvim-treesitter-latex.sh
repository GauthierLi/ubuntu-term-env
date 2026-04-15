#!/usr/bin/env bash
#
# 修复 neovim tree-sitter latex 解析器编译错误
#
# 问题：tree-sitter CLI 版本过旧，不支持 ABI version 15
# 错误信息：This version of Tree-sitter can only generate parsers with ABI version 13 - 14, not 15
#
# 用法：
#     bash fix-nvim-treesitter-latex.sh
#
# 步骤：
# 1. 安装 libclang-dev 依赖（cargo 编译需要）
# 2. 升级 tree-sitter-cli 到最新版本
# 3. 在 neovim 中运行 :TSUpdate latex
#

set -e

echo "🐱 开始修复 neovim tree-sitter latex 解析器..."

# 检查是否有 sudo 权限
if ! sudo -v 2>/dev/null; then
    echo "❌ 需要 sudo 权限来安装 libclang-dev"
    exit 1
fi

# 步骤 1: 安装 libclang-dev
echo "📦 安装 libclang-dev..."
sudo apt update
sudo apt install -y libclang-dev

# 步骤 2: 升级 tree-sitter-cli
echo "🔧 升级 tree-sitter-cli..."
cargo install tree-sitter-cli --force

# 验证版本
echo "✅ 验证 tree-sitter 版本..."
tree-sitter --version

echo ""
echo "🎉 修复完成！"
echo ""
echo "接下来请在 neovim 中运行："
echo "    :TSUpdate latex"
echo ""
echo "然后重启 neovim 即可正常使用 latex 语法高亮。"

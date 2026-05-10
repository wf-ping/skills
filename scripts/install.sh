#!/bin/bash
# install.sh - 安装 skill 到目标项目
# 用法: bash scripts/install.sh <skill-name> <target-project-path>

set -euo pipefail

SKILL_NAME="${1:?请指定 skill 名称}"
TARGET_DIR="${2:?请指定目标项目路径}"
SOURCE_DIR="$(cd "$(dirname "$0")/.." && pwd)/${SKILL_NAME}"

if [ ! -d "$SOURCE_DIR" ]; then
  echo "错误: skill '${SKILL_NAME}' 不存在"
  echo "可用 skill:"
  ls -d "$(dirname "$SOURCE_DIR")"/*/ 2>/dev/null | while read -r d; do
    basename "$d"
  done
  exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
  echo "错误: 目标路径 '${TARGET_DIR}' 不存在"
  exit 1
fi

# 创建目标 .claude/skills 目录
INSTALL_DIR="${TARGET_DIR}/.claude/skills/${SKILL_NAME}"
mkdir -p "$INSTALL_DIR"

# 复制 skill 文件
cp -r "$SOURCE_DIR"/* "$INSTALL_DIR/"

echo "✓ skill '${SKILL_NAME}' 已安装到 ${INSTALL_DIR}"

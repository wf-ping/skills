# Claude Code Skills

个人 Claude Code 技能合集。提供即装即用的 **Claude Code skill** 包，可安装到任意 Claude Code 项目的 `.claude/skills/` 目录下，扩展 Claude Code 在特定场景下的自动化能力。

## 技能清单

| skill 名称 | 说明 |
|------------|------|
| [scan-then-speckit-constitution](./scan-then-speckit-constitution/SKILL.md) | 自动扫描项目配置与约定，调用 `/speckit-constitution` 生成项目宪法 |

## 前置要求

- **Claude Code**（[安装指南](https://docs.anthropic.com/en/docs/claude-code/overview)）
- 部分 skill 依赖 GitHub 上的官方 skill，详情见各 SKILL.md

## 安装

```bash
# 安装指定 skill 到目标项目
bash scripts/install.sh <skill-name> <target-project-path>

# 示例
bash scripts/install.sh scan-then-speckit-constitution /path/to/target-project
```

安装后，在目标项目中可通过 `.claude/skills/<skill-name>/SKILL.md` 使用该 skill。

## 快速开始

1. 选择一个 skill：`ls -d */SKILL.md`
2. 安装到目标项目：`bash scripts/install.sh <skill-name> <target-project-path>`
3. 在目标项目的 Claude Code 会话中，skill 会自动加载

## 自定义 skill 开发

本仓库同时也是 skill 开发模板。新增 skill 只需：

1. 新建文件夹，命名使用 `kebab-case`
2. 创建 `SKILL.md`，包含 `name` / `description` frontmatter
3. 提交 PR

详见 [CLAUDE.md](./CLAUDE.md) 中的开发规范。

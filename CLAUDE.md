# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

此仓库是个人 Claude Code 技能合集。每个 skill 以独立文件夹组织，包含 `SKILL.md` 定义文件。

## 目录结构

```
/
├── README.md                     # 项目说明
├── CLAUDE.md                     # 本文件
├── scripts/
│   └── install.sh               # 安装 skill 到目标项目
└── <skill-name>/
    └── SKILL.md                  # 技能定义
```

## 开发规范

- 每个 skill 位于独立文件夹，命名使用 kebab-case
- 必须包含 `SKILL.md` 文件，含标准 frontmatter
- 不引入外部依赖，保持纯 prompt-based
- 若有依赖其他内置 skill，在 SKILL.md 中说明

### SKILL.md frontmatter

```yaml
---
name: <skill-name>
description: <一句话描述能力>
---
```

## 安装

```bash
bash scripts/install.sh <skill-name> <target-project-path>
```

脚本会将 skill 文件夹复制到目标项目的 `.claude/skills/<skill-name>/` 下。

## 已有技能

| 技能 | 描述 |
|------|------|
| [scan-then-speckit-constitution](./scan-then-speckit-constitution/SKILL.md) | 扫描项目配置，收集信息后调用 /speckit-constitution , 请确保系统已经安装了 github/spec-kit |

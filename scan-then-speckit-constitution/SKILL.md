---
name: scan-then-speckit-constitution
description: 为已有项目收集 constitution 所需信息，整理后直接调用 /speckit-constitution 生成或更新项目宪法。自动扫描项目配置，逐类确认约束。
allowed-tools: Read, Glob, Bash, AskUserQuestion
---

# Scan then Speckit Constitution

你是一名项目分析专家。你的任务是为当前项目收集信息，然后**直接调用 `/speckit-constitution`** 来完成 constitution 的生成或更新。

## `/speckit-constitution` 的工作方式
- 它读取 `.specify/memory/constitution.md`（或从模板复制）
- 它接受**原则/价值观**作为输入（`$ARGUMENTS`）
- 它自动替换模板中的占位符（`[PROJECT_NAME]`, `[PRINCIPLE_1_NAME]` 等）
- 它自动计算版本号、同步相关模板、输出影响报告

## 你的工作流程
1. **自动扫描项目**：读取根目录关键文件（`package.json`, `pyproject.toml`, `.eslintrc.*`, `tsconfig.json`, `.prettierrc*`, `README.md`, 目录结构），提取技术栈、工具链、测试框架等。
2. **逐类向我确认**：按下方七大类，先展示你已自动提取的信息，再用 `AskUserQuestion` 就缺失或不确定的内容提问。每次最多提 3 个问题。
3. **组织原则列表**：将确认后的信息转化为**原则条目列表**，每条原则一句话，包含 `(MUST)` / `(SHOULD)` 标注。
4. **调用命令**：将原则列表作为参数，直接执行 `/speckit-constitution <原则列表>`。

## 需要收集的七类信息

### A. 项目身份与边界
- 项目名称、一句话定位（做什么 / 不做什么）
- 目标用户（内部 / 外部，合规要求）
- 明确排除的责任范围

### B. 技术栈与工具链
- 语言及精确版本
- 核心框架
- 包管理器及**严禁**使用的依赖
- 格式化、Lint 工具与规则
- 构建与 CI/CD 约束

### C. 架构与设计决策
- 架构风格（分层、六边形、微服务等）
- 模块边界与依赖方向规则
- 关键设计模式（DI, Repository, CQRS 等）
- 通信方式（REST/gRPC/GraphQL/事件）
- **反模式禁止项**

### D. 代码规范与风格
- 命名约定（公共 API、私有字段、文件命名）
- 注释要求（docstring 强制、英文/中文）
- 文件组织规则
- 错误处理与日志规范

### E. 测试要求
- 测试框架与必测层次（单元/集成/E2E）
- **硬性覆盖率阈值**
- 测试文件命名与放置规则，Mock 限制
- 必须覆盖的异常路径

### F. 安全与合规
- 敏感数据保护
- 输入验证标准
- 依赖安全策略（零高危、许可证限制）
- 认证授权模式及不可违规则

### G. 协作规约（可选）
- 提交信息格式（Conventional Commits）
- 分支命名、PR 规模
- 环境变量管理（`.env.example` 强制，禁止硬编码）

## 最终执行方式

收集完信息后，按以下格式组织原则列表，然后直接执行：

/speckit-constitution 项目为内部订单管理平台 (MUST 仅限内部使用)。后端采用 Python 3.12 + FastAPI (MUST 分层架构 Controller → Service → Repository)。所有公共 API 须包含类型注解与英文 docstring (MUST)。单元测试覆盖率≥80% (MUST)。使用 pnpm 管理前端依赖 (MUST)，禁用 npm 或 yarn……

**重要**：直接调用命令，不要让我手动复制粘贴。

立即开始：读取项目文件，展示已提取的信息，并向我确认第一个缺失项。

# xu_cursor_skill

**徐的 Cursor Skills** · 作者：[weixuan-XU](https://github.com/weixuan-XU)（徐）

本仓库（[`xu_cursor_skill`](https://github.com/weixuan-XU/xu_cursor_skill)）收录我自己编写的 Agent Skills。格式遵循 [Agent Skills](https://agentskills.io) 标准（目录 + `SKILL.md`），**Cursor、Claude Code、Codex 通用**。非 fork、非搬运合集。

## 已收录 Skills

| Skill | 说明 |
|-------|------|
| [`skill-desc-zh`](skills/skill-desc-zh/SKILL.md) | 安装/同步 skill 后，自动汉化 `SKILL.md` 的 `description`（列表简介） |
| [`example-skill`](skills/example-skill/SKILL.md) | 新建 skill 用的模板 |

## 在 Cursor / Claude Code / Codex 里用

`SKILL.md` 三家都能读。差别只在扫描目录，本仓库已经同时放好：

| 产品 | 打开本仓库时自动发现 | 装到本机（所有项目可用） |
|------|----------------------|--------------------------|
| Codex、Cursor | `.agents/skills/` | `~/.agents/skills/` |
| Claude Code | `.claude/skills/` | `~/.claude/skills/` |
| Cursor | 上面两处都会读，另外也读 `.cursor/skills/` | `~/.cursor/skills/` |

`skills/` 是唯一源。改完后同步到另外两处再提交：

```powershell
powershell -File scripts/sync-layouts.ps1
```

装到当前用户（Windows）：

```powershell
powershell -File scripts/install.ps1
```

macOS / Linux：

```bash
bash scripts/install.sh
```

装完后重开一次对应产品的 skill 列表。Codex 用 `$技能名` 调用，Claude Code 用 `/技能名`，Cursor 在 Agent 对话里用 `/` 选择。

## 目录结构

```
skills/                  # 源（只改这里）
  skill-desc-zh/SKILL.md
  example-skill/SKILL.md
.agents/skills/          # Codex、Cursor 自动发现（由 sync 生成）
.claude/skills/          # Claude Code 自动发现（由 sync 生成）
```

## 如何添加 skill

1. 在 `skills/` 下新建目录（小写 + 连字符，如 `my-workflow`）
2. 编写 `SKILL.md`（`name` + `description` 必填；`name` 与目录名一致）
3. 运行 `scripts/sync-layouts.ps1`（或 `install` 脚本）
4. 提交并推送

## Skill 模板

见 [`skills/example-skill/SKILL.md`](skills/example-skill/SKILL.md)。

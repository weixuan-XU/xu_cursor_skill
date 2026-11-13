---
name: skill-desc-zh
description: "【徐原创】下载、安装、同步、复制或更新 Agent Skill 后，把 SKILL.md 的 description（列表简介）自动汉化。用户说装 skill、下载 skill、openskills install/sync、从 GitHub 拉 skills、汉化 skill 简介时必须使用。"
metadata:
  author: weixuan-XU
  author_name: 徐
---

# Skill 简介自动汉化（徐原创）

作者：徐（[weixuan-XU](https://github.com/weixuan-XU)）

装完 skill 不等于完成。只要本轮新增或更新了 skill，就立刻汉化其 `description`，让 Cursor skill 列表显示中文简介。

## 何时触发

以下任一情况，**安装步骤结束后立刻执行**本流程（不要等用户再提醒）：

- 用户要求下载 / 安装 / 同步 / 更新 skill
- `git clone` / 解压 / 复制 skill 目录到 skills 路径
- `openskills install` / `openskills sync`
- 用户明确说「汉化 skill 简介」

## 作用范围

| 做 | 不做 |
|---|---|
| `~/.cursor/skills/<name>/SKILL.md` | `~/.cursor/skills-cursor/`（Cursor 内置，改了会被覆盖） |
| 项目内 `.cursor/skills/<name>/SKILL.md` | 项目 `.claude/skills/` 除非用户明确要求 |
| 本轮新装或覆盖更新的 skill | 无关、未改动的旧 skill（除非用户说「全部汉化」） |

## 汉化规则（只改 description）

1. **只改 YAML frontmatter 的 `description` 字段**；正文、脚本、资源文件一律不动。
2. **一整条中文**：说清「做什么 + 何时用」；第三人称；长度建议 ≤ 300 字，硬上限 1024 字符。
3. **保留触发用英文关键词**：文件后缀与专有名（如 `.pptx`、`.docx`、PDF、MCP、arXiv、Playwright、Slack）留在中文句里，避免降低自动触发率。
4. **已是中文则跳过**：`description` 主体已是简体中文（可含英文关键词）→ 不改。
5. **禁止重复字段**：frontmatter 里只能有一个 `description:`；写入前删掉旧的（含 `>` / `>-` / `|-` 多行块）。
6. **推荐写成单行双引号**：`description: "……"`；内部 `"` 与 `\` 按 YAML 转义。
7. **保留其余 frontmatter**（`name`、`license`、`metadata` 等）与正文原样。

## 执行步骤

1. 列出本轮写入/更新过的 skill 目录（每个含 `SKILL.md`）。
2. 读每个文件的 frontmatter，取出当前 `description`。
3. 若已是中文 → 记入「跳过」；若在 `skills-cursor` → 记入「跳过（内置）」。
4. 否则写成符合上方规则的中文 `description`，写回文件，确保无重复 `description:`。
5. 向用户汇报：汉化了哪些、跳过了哪些；并提示新开对话或重开 skill 列表后可见中文简介。

## 示例

英文原：

```yaml
description: Create slide decks from .pptx files. Use when the user mentions slides or presentations.
```

汉化后：

```yaml
description: "创建或编辑幻灯片（.pptx / .potx）。用户提到 slides、presentation、路演 PPT 时使用。"
```

## 反例

- 只装不汉化就说「好了」
- 翻译整份 `SKILL.md` 正文
- 改 `skills-cursor` 里的内置 skill
- 留下两个 `description:` 字段
- 去掉所有英文关键词导致难以触发

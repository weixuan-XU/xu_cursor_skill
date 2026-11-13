# cursor-skills

Cursor Agent Skills 合集仓库。每个 skill 是一个目录，内含必需的 `SKILL.md`。

## 已收录 Skills

| Skill | 说明 |
|-------|------|
| [`skill-desc-zh`](skills/skill-desc-zh/SKILL.md) | 安装/同步 skill 后，自动汉化 `SKILL.md` 的 `description`（列表简介） |
| [`example-skill`](skills/example-skill/SKILL.md) | 新建 skill 用的模板 |

## 目录结构

```
skills/
  skill-desc-zh/
    SKILL.md
  example-skill/
    SKILL.md          # 模板：YAML frontmatter + 使用说明
  <your-skill>/
    SKILL.md
    scripts/          # 可选
    references/       # 可选
```

## 如何添加 skill

1. 在 `skills/` 下新建目录（小写 + 连字符，如 `my-workflow`）
2. 编写 `SKILL.md`（`name` + `description` 必填）
3. 提交并推送到本仓库

## 安装到本机

把某个 skill 复制或同步到 Cursor 的 skills 目录后即可使用，例如：

- 用户级：`~/.cursor/skills/<skill-name>/`
- 或个人 Agent Store 中的 `skills/<skill-name>/`

也可用社区工具（如 openskills）从本仓库安装。

## Skill 模板

见 [`skills/example-skill/SKILL.md`](skills/example-skill/SKILL.md)。

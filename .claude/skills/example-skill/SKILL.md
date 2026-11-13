---
name: example-skill
description: "【徐原创】示例 skill 模板。创建新 skill 时复制本目录并改名；仅在用户明确提到 example-skill 或「示例 skill」时使用，不要自动触发。"
metadata:
  author: weixuan-XU
  author_name: 徐
compatibility: "Cursor、Claude Code、Codex。Agent Skills 标准：目录内 SKILL.md，frontmatter 含 name 与 description。"
disable-model-invocation: true
---

# Example Skill（徐原创模板）

作者：徐（[weixuan-XU](https://github.com/weixuan-XU)）

兼容：Cursor、Claude Code、Codex（同一份 `SKILL.md`）。`disable-model-invocation` 在 Cursor 与 Claude Code 中生效；Codex 会忽略该字段，仍可读正文。

把本文件改成你的 skill 说明。Agent 会按这里的步骤执行。

## 何时使用

- 用户说了会触发本 skill 的关键词或场景（写在上方 `description` 里）

## 步骤

1. 确认用户目标与约束
2. 按本 skill 约定的流程执行
3. 交付结果并说明做了什么

## 输出

说明期望的交付物格式（文件、报告、代码改动等）。

## 示例

**用户：** ……  
**做法：** ……

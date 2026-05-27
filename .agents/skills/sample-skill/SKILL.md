---
name: sample-skill
description: Scaffold, adapt, or maintain a basic Codex skill for a project or workspace. Use when Codex needs to create a new custom skill, rewrite an existing sample into valid Codex skill format, define project-specific instructions, or organize reusable skill resources such as scripts, references, and assets.
---

# Sample Skill

Use this skill as a clean starting point for a custom Codex skill.

Keep the skill focused on one job. Replace placeholder guidance with concrete instructions that another Codex instance can execute without extra explanation.

## Workflow

1. Confirm the exact purpose of the skill.
2. Update the frontmatter `name` and `description` so the description clearly states what the skill does and when to use it.
3. Keep this file short and procedural. Put detailed documentation in `references/` only when needed.
4. Add executable helpers to `scripts/` only for repetitive or fragile tasks.
5. Add templates or binary resources to `assets/` only when they are consumed by the final output.
6. Remove any unused sections, files, or directories before considering the skill complete.

## Writing Rules

- Use imperative instructions.
- Prefer concise examples over long explanations.
- Do not add extra documentation files such as `README.md` or `CHANGELOG.md`.
- Keep "when to use" guidance in the frontmatter description, not in the body.
- Reference files in `references/`, `scripts/`, or `assets/` directly when they matter to execution.

## Suggested Uses

- Define project-specific coding rules.
- Force a preferred response language or tone.
- Describe Flutter, backend, or deployment conventions.
- Bundle helper scripts or templates that Codex should reuse.

## Resource Guide

### `scripts/`

Store executable helpers here when the same logic would otherwise be rewritten repeatedly.

### `references/`

Store detailed docs here when they are useful but too large for `SKILL.md`.

### `assets/`

Store templates, boilerplate, images, or other output resources here.

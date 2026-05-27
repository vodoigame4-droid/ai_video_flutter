---
name: generate-daily-report
description: Extract git commits for a specific date (or today), group them into logical features, estimate hours spent, and format a concise Daily Report matching a specific layout (CC: @tktommy678, Project: DreamGirl 3).
---

# Generate Daily Report Skill

Use this skill to automate the generation of a daily developer progress report by scanning git commits and modified files for a specific date.

## Workflow

1. **Identify the Target Date**:
   - If the user specifies a date (e.g., "26/05", "May 26th", "yesterday"), parse it into a standard format (`DD/MM` or `YYYY-MM-DD`).
   - If no date is specified, default to today's date.

2. **Execute Commit Extraction**:
   - Run the commit extraction helper script:
     ```bash
     python3 .agents/skills/generate-daily-report/scripts/get_commits.py [date]
     ```
   - (Substitute `[date]` with `DD/MM` e.g., `26/05` or `YYYY-MM-DD`).

3. **Analyze and Group Commits**:
   - Read the list of commits, commit messages, and changed files printed by the script.
   - Group related commits into logical tasks (e.g., UI updates, Business Logic, Bug fixes).
   - For each group, list brief and high-level accomplishments. Keep each bullet point short, focused, and concise (e.g., "Updated screen UI and resolved styling issues" instead of listing file paths).

4. **Estimate Task Duration**:
   - Distribute working hours across the grouped tasks logically (typically summing to a standard workday of 8 hours, or distributed proportionally to the complexity/scope of changes in each task).
   - End each task line with ` – Xh` (where `X` is the estimated hours, e.g., ` – 2h`).

5. **Format the Output**:
   - Format the final daily report exactly as follows (maintain spelling, spacing, and bullet styles):

```text
Daily Report – [DD/MM]
CC: @tktommy678 
Project: DreamGirl 3
Tasks:
• [Task 1 Name] – [X]h
  - [Single-line concise accomplishment detail]
• [Task 2 Name] – [Y]h
  - [Single-line concise accomplishment detail]
```

## Rules

- **Be Extremely Concise (Single Line)**: Write exactly 1 short, high-level line of accomplishment per task. Do NOT write multiple bullets or multi-line details. Do NOT list file paths, commit messages, or low-level technical changes.
- **Do Not Hardcode Date**: Extract the date dynamically from the commits/current context or the argument passed.
- **Project Scope**: Default project name to `DreamGirl 3` and CC to `@tktommy678` unless the user specifies otherwise.

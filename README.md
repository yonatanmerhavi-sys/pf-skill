# pf — Prompt Forge

A Claude Code skill. You write what you want in your own words; it returns a
ready-to-paste prompt for a new Claude conversation plus a short guide for
steering that conversation (which mode to start in, what to check, what to say
along the way, how to finish). Works in any language and on any topic.

```
/pf I want a landing page for my bakery that takes pre-orders
```

## Install (once, works in every project)

```bash
git clone https://github.com/<owner>/pf-skill.git
cd pf-skill && ./install.sh
```

This copies `pf/` to `~/.claude/skills/pf`. Open a new Claude Code session and
type `/pf`. To update later: `git pull && ./install.sh`.

Manual install: copy the `pf` folder into `~/.claude/skills/`.

Only for one project: copy it into `<project>/.claude/skills/` instead.

## What you get back

1. **Understood**: the goal restated, so a misunderstanding shows immediately.
2. **Assumptions**: what it assumed instead of asking (at most 3 questions when something critical is missing).
3. **The prompt**: one block to copy, with goal and why, context, requirements, scope, workflow, skills to use, a checkable done list, when to stop and ask, and the output.
4. **How to run the conversation**: before / during / after, with ready phrases.

It never does the task itself. Say "go" afterwards if you want it to.

---

## בעברית

סקיל ל-Claude Code. כותבים במילים שלכם מה רוצים, ומקבלים פרומפט מוכן להדבקה בשיחה חדשה, ועוד מדריך קצר לניהול השיחה: באיזה מצב להתחיל (למשל plan mode), מה לבדוק, מה להגיד בדרך ואיך לסיים.

**התקנה:** `git clone` לריפו, ואז `./install.sh`. אפשר גם להעתיק ידנית את התיקייה `pf` אל `~/.claude/skills/`. אחר כך פותחים שיחה חדשה וכותבים:

```
/pf אני רוצה ...
```

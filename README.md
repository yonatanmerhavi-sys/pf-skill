# pf — Prompt Forge

A Claude Code plugin. You write what you want in your own words; it returns a
ready-to-paste prompt for a new Claude conversation plus a short guide for
steering that conversation (which mode to start in, what to check, what to say
along the way, how to finish). Works in any language and on any topic.

```
/pf:pf I want a landing page for my bakery that takes pre-orders
```

## Install as a plugin (recommended)

Inside Claude Code:

```
/plugin install pf --marketplace yonatanmerhavi-sys/pf-skill
```

On older Claude Code versions, two steps:

```
/plugin marketplace add yonatanmerhavi-sys/pf-skill
/plugin install pf@pf-skill
```

Then run `/reload-plugins` or open a new session and type `/pf:pf`.
Updates arrive through `/plugin` (marketplace → update).

### Cloud sessions (claude.ai/code)

The user folder of a cloud session resets every session. To have `pf` in every
cloud session of a project, add this to the project's `.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "pf-skill": {
      "source": { "source": "github", "repo": "yonatanmerhavi-sys/pf-skill" }
    }
  },
  "enabledPlugins": {
    "pf@pf-skill": true
  }
}
```

## Install without a plugin (shorter command: `/pf`)

```bash
git clone https://github.com/yonatanmerhavi-sys/pf-skill.git
cd pf-skill && ./install.sh
```

This copies the skill to `~/.claude/skills/pf`, so you type `/pf` instead of
`/pf:pf`. To update later: `git pull && ./install.sh`.

## What you get back

1. **Understood**: the goal restated, so a misunderstanding shows immediately.
2. **Assumptions**: what it assumed instead of asking (at most 3 questions when something critical is missing).
3. **The prompt**: one block to copy, with goal and why, context, requirements, scope, workflow, skills to use, a checkable done list, when to stop and ask, and the output.
4. **How to run the conversation**: before / during / after, with ready phrases.

It never does the task itself. Say "go" afterwards if you want it to.

---

## בעברית

פלאגין ל-Claude Code. כותבים במילים שלכם מה רוצים, ומקבלים פרומפט מוכן להדבקה בשיחה חדשה, ועוד מדריך קצר לניהול השיחה: באיזה מצב להתחיל (למשל plan mode), מה לבדוק, מה להגיד בדרך ואיך לסיים.

**התקנה כפלאגין:** בתוך Claude Code כותבים:
```
/plugin install pf --marketplace yonatanmerhavi-sys/pf-skill
```
ואז מפעילים עם `/pf:pf` ואחריו מה שרוצים.

**התקנה בלי פלאגין** (הפקודה יוצאת קצרה יותר, `/pf`): עושים `git clone` לריפו ומריצים `./install.sh`.

**שיחות בענן:** מוסיפים לפרויקט את קטע ה-`settings.json` שמופיע למעלה, והפלאגין יהיה זמין בכל שיחה בענן של אותו פרויקט.

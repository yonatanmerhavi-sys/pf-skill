---
name: pf
description: Prompt Forge. Turns a rough request, in any language and on any topic (code, writing, research, business, design, learning), into a ready-to-paste prompt for a fresh Claude conversation, plus a short guide for steering that conversation (which mode to start in, what to check, what to say mid-way, how to finish). Use only when the user invokes /pf or explicitly asks to rewrite, improve or build a prompt for Claude.
argument-hint: <what you want, in your own words>
disable-model-invocation: true
---

# pf — Prompt Forge

The user writes what they want in their own words. You do **not** do the task.
You return (1) a copy-paste prompt that a fresh Claude conversation can execute
to an excellent result, and (2) a steering guide for running that conversation.

Raw request: $ARGUMENTS

If the raw request is empty, ask the user in one line what they want to do.

Read `references/playbook.md` before writing the output. It holds the
principles, the task-type → workflow table and the anti-patterns list.

## Step 1 — Understand the request

Classify it (it can be more than one):
- **Code**: feature, bug, refactor, review, new project, script, automation.
- **Writing**: email, post, article, copy, script, translation, editing.
- **Research / analysis**: question, comparison, market research, data analysis.
- **Business / planning**: plan, strategy, pricing, process, decision.
- **Design / visual**: UI, presentation, diagram, dashboard, image brief.
- **Learning**: explain, teach, quiz, study plan.

Extract: the goal, *why* the user wants it (the outcome for them or their
audience), who the audience is, what "done" looks like, and what must not
change. If the task bundles several unrelated goals, plan to split them.

## Step 2 — Decide where the prompt will run

- **Claude Code** (terminal / desktop / web / IDE): anything that reads or
  changes files, runs commands, or lives in a codebase.
- **Claude app (claude.ai / desktop / mobile chat)**: writing, research,
  thinking, analysis of attached files, artifacts.

Infer it from the request; if truly unclear, default to Claude Code for code
and to the Claude app for everything else, and state that under assumptions.

## Step 3 — Gather context (read-only, quick)

- **If you are inside a project folder and the task is about it**: read its
  `CLAUDE.md` / `AGENTS.md` / `README`, and spend a few searches to find the
  real files, modules and existing patterns involved, so the prompt names
  real things ("follow how `src/billing/invoice.ts` does X"). Never edit files.
- **If the task is not about the current folder**: do not read the project.
  Rely on the request; ask for what is missing.
- Look at the skills, tools and connectors available in *this* session and
  note the ones that fit the task. Only name a skill in the prompt if it
  exists, or mark it "if available".

## Step 4 — Fill the gaps

If something critical is missing and cannot be inferred (audience, platform,
tech stack, length, tone, deadline, budget), ask **at most 3** short questions
with concrete options (AskUserQuestion when available). Otherwise assume
sensibly and list each assumption so the user can correct it.

## Step 5 — Choose the workflow

From the playbook: start mode (plan vs direct; Research / extended thinking in
the app), effort level, which skills to invoke and when, whether to use
subagents, how the result is verified, and the exit (commit / PR / file /
artifact / just the answer). Default for anything touching more than ~2 files,
data that can be lost, auth, payments or production: **plan first**.

## Step 6 — Write the prompt

Rules for the prompt text:
- Write it in the user's language; keep code identifiers, paths, commands and
  skill names exactly as they are.
- Be explicit and concrete. Give the *why* behind each constraint.
- Say what to do, not only what to avoid. No ALL-CAPS, no threats.
- Name real anchors: files, existing patterns, audience, examples of tone.
- "Done" must be checkable, not "works well" / "sounds good".
- Tell the model how to check its own work before reporting.
- Tell it when to stop and ask instead of guessing.
- Include one short example when the output format matters.
- As short as the task allows. A one-line fix gets a short prompt.

### Template (omit sections that don't apply; translate headings to the user's language)

```
<goal>
1-2 sentences: what to produce and why it matters (for whom, what changes for them).
</goal>

<context>
- Relevant files / material / audience / background.
- Existing pattern or example to follow.
- Project rules to read first (CLAUDE.md, etc.), if any.
</context>

<requirements>
1. ...
2. ...
(mark must-have vs nice-to-have when the list is long)
</requirements>

<out_of_scope>
- What not to touch or include, and why.
</out_of_scope>

<approach>
1. Explore / gather what you need before producing anything.
2. Present a short plan (what changes, risks, open questions) and wait for my approval.
3. Execute in small steps. Use skill <name> when <condition>.
4. Verify: <commands / checks / review against the requirements>.
</approach>

<done_when>
- [ ] checkable condition 1
- [ ] checkable condition 2
</done_when>

<ask_before>
- Deleting data, irreversible actions, money, security, anything public.
- Two reasonable directions with a real trade-off.
</ask_before>

<output>
Format, length, language, and where it goes (file, commit + PR, artifact, chat).
End with a short summary: what was done, how it was checked, what is still open.
</output>
```

## Step 7 — Write the steering guide

Short and practical, in the user's language, specific to *this* task:
1. **Before sending**: new conversation (or `/clear`); which mode — in Claude
   Code e.g. "press Shift+Tab until plan mode shows", `/effort high`; in the
   app e.g. "turn on Research / extended thinking", "attach file X", "use a
   Project if you will do this repeatedly".
2. **During**: what to check in the plan before approving (concrete to this
   task), 2-4 ready phrases for the decision points, when to press Esc and
   redirect.
3. **At the end**: how to verify (e.g. `/code-review`, `/security-review`,
   running the app, reading against the done list) and what to ask for before
   accepting (diff summary, risks, sources).

## Output format (exactly this order)

1. **Understood**: 1-3 lines restating the goal, so a misunderstanding shows
   immediately.
2. **Assumptions**: bullets, only if any.
3. **The prompt**: one fenced code block, nothing else inside it, ready to copy.
4. **How to run the conversation**: the steering guide.
5. **Optional**: one line if splitting into several conversations is better,
   with the order.

Translate these headings to the user's language.

Do not start executing the task, even if it looks small. If the user then says
"go" / "run it", that is a new request: execute it as the prompt describes.

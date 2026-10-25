# Playbook — principles, workflow and anti-patterns

## What makes a prompt work with Claude

1. **Goal + why.** "Write X so that Y happens for Z" beats "write X". The
   reason lets Claude decide well on details nobody specified.
2. **Real anchors.** Files, names, the audience, an example to imitate, a link
   or attachment. Vague prompts get generic results.
3. **Checkable done.** A list Claude can test its own result against.
4. **A way to verify.** Tests, lint, running the app, sources to cite, a
   checklist to review against. Claude does far better when it can check.
5. **Explore → plan → do → verify.** Separate thinking from doing for anything
   non-trivial. Plan mode (Claude Code) or "show me the outline first" (app).
6. **Scope fence.** What not to touch or include, and why.
7. **Stop conditions.** Where Claude must ask instead of deciding.
8. **One goal per conversation.** Split big work; start each part fresh.
9. **Calm, positive phrasing.** "Do X" over "NEVER do Y". Shouted rules get
   over-applied.
10. **Show, don't only tell.** One sample of the desired output (tone, format,
    structure) is worth a paragraph of description.
11. **Context over cleverness.** Who it is for, where it will be used and what
    was already tried matter more than prompt tricks or role-play.

## Task type → workflow

| Task | Where | Start mode | Effort | Skills / tools to name (if available) | Verify with |
|---|---|---|---|---|---|
| Small code fix, clear cause | Claude Code | normal | medium | — | run tests / the app |
| Bug, unclear cause | Claude Code | plan | high | Explore subagent; reproduce first | reproduce → fix → reproduce shows fixed |
| New feature | Claude Code | plan | high | `run`, `code-review` | done list, run the app |
| New project from scratch | Claude Code | plan | high | stack-specific skills, `init` | it runs; README explains how |
| Refactor / cleanup | Claude Code | plan | medium | `simplify`, `code-review` | behavior unchanged, tests pass |
| Auth / payments / personal data | Claude Code | plan | max | `security-review` | `/security-review`, test mode |
| Code review | Claude Code | normal | high | `code-review` | — |
| Script / automation | Claude Code | plan | medium | `loop`, routines for recurring | dry run on sample data |
| Using an LLM API | Claude Code | plan | high | `claude-api` | one real call works |
| Email / post / copy | App | normal | medium | — | read against audience + goal; 2-3 variants |
| Long article / doc | App | outline first | high | `docx` / `pdf` for files | outline approved → draft → edit pass |
| Presentation | App or Code | outline first | medium | `pptx`, artifacts | slide outline approved first |
| Spreadsheet / data analysis | App or Code | normal | high | `xlsx`, `dataviz` | numbers re-checked, assumptions listed |
| Research / comparison | App | Research mode | high | web search | sources cited, dates checked |
| Business plan / strategy / decision | App | extended thinking | high | — | options with trade-offs, a recommendation |
| Dashboard / page to share | App or Code | normal | medium | artifacts, `dataviz` | link opens on phone |
| Learning a topic | App | normal | medium | — | ask Claude to quiz you at the end |
| A repeated workflow | Code | plan | medium | `skill-creator` | the new skill runs once correctly |

Effort: `low` trivial, `medium` normal, `high` multi-step or subtle, `max` for
money, security or anything that cannot be undone.

## Steering phrases (adapt to the task and the user's language)

- Approve with a change: "The plan is good, but <change>. Go."
- Too big: "Split it: do only step 1 now and stop."
- Going in circles: Esc, then "Stop. In one sentence: what's the problem and
  what have you tried? Suggest two directions."
- Prove it: "Show me it works: <run / screenshot / test output>."
- Before accepting: "Summarize what changed and list the risks."
- Not my tone: "Too formal. Here's an example of how I write: <sample>."
- Long conversation: "Write a handoff summary for a new conversation."

## Anti-patterns to rewrite away

- "Make it good / work well" → define good.
- "Fix the bug" with no symptom → steps, expected vs actual.
- Several unrelated goals in one prompt → split.
- "Don't break anything" → name what must keep working and how to check.
- A long spec with no priorities → must-have vs nice-to-have.
- No exit instruction → say what the deliverable is and where it goes.
- "Use best practices" → name the practice, or the example to follow.
- "Act as a world-class expert" with no context → give the context instead.

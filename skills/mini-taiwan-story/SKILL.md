---
name: mini-taiwan-story
description: Turn a map screenshot or visible Taiwan phenomenon into a verified Mini Taiwan Stories article. Use for maintaining the topic bank, researching context, validating data and sources, fixing an embed view, obtaining outline approval, drafting, editing, scoring, or finishing any article in this repository.
---

# Mini Taiwan Story

Use this skill for every Mini Taiwan Stories article, including work that begins with only a screenshot and an unexplained phenomenon.

## Required workflow

1. Read [`../../CLAUDE.md`](../../CLAUDE.md), [`../../README.md`](../../README.md), and the local [article guidelines](../../docs/editorial/ARTICLE_GUIDELINES.md).
2. Read [the workflow contract](references/workflow.md) before deciding the next stage.
3. Update [`../../TOPIC_BANK.md`](../../TOPIC_BANK.md) when a phenomenon is proposed, split, paused, rejected, or published.
4. Ensure the article directory contains `workbook.md`. Copy [the workbook template](assets/article-workbook.md) when starting a new article; do not overwrite an existing workbook.
5. Resume from the first incomplete workbook gate. If an existing workbook predates the current template, add the missing applicable gate fields without erasing prior decisions. Do not redo completed research unless its source or data version may have changed.
6. Record outputs and decisions in the workbook as work proceeds. A skipped item needs an explicit `不適用` reason.
7. Treat the local article guidelines as the writing SSOT. The upstream Taiwan.md repository is provenance and a refresh source, not a runtime dependency.

## Two shared pre-draft gates

Pause for the user at these two editorial decisions unless the user has already provided the answer:

- **Map gate:** the user confirms the chosen view, layers, and visual emphasis. Research may continue while the view is being tuned.
- **Outline gate:** the user confirms the central finding, article boundary, and narrative order before full prose is generated.

Do not turn every research finding into prose. If an outline carries more than one central finding, propose a series and keep one finding per article.

## Evidence invariants

- Treat the screenshot as an observation, not an explanation.
- Separate `map observation`, `source fact`, `computed result`, `interpretation`, and `causal claim` in the claim ledger.
- Put every number selected for the outline or prose in `data.json` before drafting. Record value, unit, as-of date, population or scope, method, query or formula, source, and caveat. Keep exploratory calculations in research notes.
- Recalculate derived values from raw ledger values. Do not copy rounded values between notes and prose.
- Check the official landing page and newest available edition before calling a source current. Prefer an official published core metric; use self-computation for dimensions the official source does not provide or for an explicitly separated comparison.
- A map can be `direct evidence`, `regional context`, or `illustration`. Its caption and prose may not exceed that scope.
- Keep source existence, drawable data, local embed, production embed, and published article as separate states.
- Prefer omission or qualified language when evidence cannot distinguish correlation, mechanism, and cause.

## Completion

An article is complete only when the workbook records source and number verification, map status, trimming and story review, the current rubric score, remaining limitations, references, and release state. Rubric v0.1 has no fixed passing total; factual blockers still prevent publication. Final human acceptance authorizes publication and is not a third pre-draft waiting gate.
